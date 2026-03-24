//
//  CoinManager.swift
//  ByteCoin Personal
//
//  Created by Michael Peralta on 1/17/23.
//

import Foundation
protocol CoinManagerDelegate {
    func didUpdateCurrency(_ Currency: String, bitcoinPrice: Double)
    func didFailWithError(error: Error)
    
}

struct CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "DC754460-2CF2-4121-8B4F-1BFE2F5CE0F4"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var delegate: CoinManagerDelegate?
    
    func getCoinPrice(for currency: String){
        //Use
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        //use optional binding to unwrap the URL created
        if let url = URL(string: urlString){
            //create a new URLSession object
            let session = URLSession(configuration: .default)
            
            //create a new Data task for th URLSession
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                //format the data we got back as String to be able to print
                if let safeData = data{
                    let bitcoinPrice = parseJson(safeData)
                   
                    self.delegate?.didUpdateCurrency(currency, bitcoinPrice: bitcoinPrice!)

                    print(bitcoinPrice!)
                }
            }
            
            //Start task to fetch data from API
            task.resume()
            
        }
        
        func parseJson(_ data: Data) -> Double? {
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(CoinData.self, from: data)
                let lastPrice = decodedData.rate
                
                return lastPrice
                
            } catch {
                self.delegate?.didFailWithError(error: error)
                return nil
            }
        }
     
    }
}
