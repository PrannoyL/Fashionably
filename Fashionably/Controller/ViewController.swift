//
//  ViewController.swift
//  Fashionably
//
//  Created by Hrithvik  Alex on 2019-01-12.
//  Copyright © 2019 Hrithvik  Alex. All rights reserved.
//

import UIKit
import CoreLocation
import CoreML
import Vision
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "e72ca729af228beabd5d20e3b7749713"
    
    
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    
     let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
    }
    
    //Image picker methods
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//
//        if let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            guard let ciImage = CIImage(image: userPickedImage)else {
//                fatalError("could not convert")
//            }
//
//            detect(image: ciImage)
//            ImageView.image = userPickedImage
//        }
//
//        imagePicker.dismiss(animated: true, completion: nil)
//    }
//
//    func detect(image: CIImage){
//
//        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
//            fatalError("cannot import")
//        }
//
//        let request = VNCoreMLRequest(model: model) { (request, error) in
//            guard let classification = request.results?.first as? VNClassificationObservation else {
//                fatalError("No flower found")
//            }
//
//            self.navigationItem.title = classification.identifier.capitalized
//            self.requestInfo(flowerType: classification.identifier)
//
//        }
//
//        let handler = VNImageRequestHandler(ciImage: image)
//        
//        do {
//            try handler.perform([request])
//        } catch {
//            print(error)
//        }
//    }
    
    
    // Getting Weather Data from API
    func getWeatherData(url: String, parameters: [String: String]) {
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                
                print("Success! Got the weather data")
                let weatherJSON : JSON = JSON(response.result.value!)
                print(weatherJSON)
                
            }
            else {
                print("Error \(String(describing: response.result.error))")
            }
        }
        
    }
    
    
    // CLLocationManager Delegate methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            
            self.locationManager.stopUpdatingLocation()
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "lon" : longitude, "appid" : APP_ID]
            
            getWeatherData(url: WEATHER_URL, parameters: params)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}















