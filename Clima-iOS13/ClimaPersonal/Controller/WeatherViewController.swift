//
//  ViewController.swift
//  ClimaPersonal
//
//  Created by Michael Peralta on 12/8/22.
//

import UIKit
import CoreLocation


class WeatherViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    
    // Declaring Weather and location Manager properties
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self //Setting the WeatherViewController as delegate of location Manager
        locationManager.requestWhenInUseAuthorization() //Requesting authorization from user to get the location from the device
        //calling this method to request location will trigger the didUpdateLocations Methods from CLLocationManagerDelegate protocol
        locationManager.requestLocation()
        
        weatherManager.delegate = self //setting this VC class as delegate of WeatherManager Struct
        searchTextField.delegate = self //setting this VC class as delegate of UItextField protocol
        
    }
    //this IBAction triggers the location request for system location
    @IBAction func LocationButtonPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
}

//MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate{
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        } else{
            textField.placeholder = "Type a City Name"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            //#1 this method will send the city name data to the weatherManager and fetch the Weather Data
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
    }
}
//MARK: - WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel){
        //As the data request can take time to get the data and send it to be display in the screen from a complition handler is necesary to handle Main Thread Checker using the DispatchQueue.main.Async block
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
        print(weather.temperature,weather.temperatureString, weather.conditionName, weather.cityName)

    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate
// This LocationManager will get take the location from the device after authorization and use it to send the location info and send it to be process and displayed
extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //it will take the last location data form the Array and asigned to location property
        if let location = locations.last {
            locationManager.stopUpdatingLocation() //this will stop the location to been updated after get the actual location info
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            weatherManager.fetchWeather(latitude: lat, longitute: lon)
        }
        print("Got location")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
