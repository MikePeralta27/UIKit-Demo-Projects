//
//  ViewController.swift
//  SeaFood1
//
//  Created by Michael Peralta on 2/28/26.
//

import UIKit
import CoreML
import Vision


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage { // picked image by the user
            imageView.image = userPickedImage
            
            guard let ciimage = CIImage(image: userPickedImage) else { // Convert the picked image to a CIImage format (Core Image Image )
                fatalError("error: Could not convert UIImage to CIImage.")
            }
            
            dectect(image: ciimage) // Insert the Picked CI Image to the detect image func
            
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func dectect(image: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else { // Load the model
                fatalError("error: Loading CORE ML model failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in // Create the request  - ASk the model to clasify the passed data
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("error: Loading CORE ML model failed.")
            }
            
            if let firstResult = results.first {
                if firstResult.identifier.contains("hotdog") {
                    self.navigationItem.title = "Hot Dog!"
                } else {
                    self.navigationItem.title = "Not a Hot Dog!"
                }
            }
        }
         let handler = VNImageRequestHandler(ciImage: image) // Defining the Passed data
        
        do{
            try handler.perform([request]) // perform request
        } catch {
            print("error: \(error.localizedDescription)")
        }
        
        
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
}

