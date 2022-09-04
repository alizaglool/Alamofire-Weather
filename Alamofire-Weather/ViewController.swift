//
//  ViewController.swift
//  Alamofire-Weather
//
//  Created by Zaghloul on 03/09/2022.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressureLable: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    var cityId = "360630"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChangeCityName), name: NSNotification.Name(rawValue: "ChangeCity"), object: nil)
        weatheCityInfo()
         
    }
    
    func weatheCityInfo() {
        // Quary Prameter
        let pramas = ["id": cityId, "appid": "1af3136dc0d2449b328188f4ab930837"]
        // method using change pramas swift to JOSN (Quary Pramter)
        AF.request("https://api.openweathermap.org/data/2.5/weather", parameters: pramas, encoder: URLEncodedFormParameterEncoder.default).responseJSON { response in
            if let result = response.value {
                let JOSNDectinery = result as! NSDictionary
                let main = JOSNDectinery["main"] as! NSDictionary
                var temp = main["temp"] as! Double
                let pressure = main["pressure"] as! Double
                let humidity = main["humidity"] as! Double
                
                temp = temp - 272.15
                temp = Double(round(1000 * temp ) / 1000)
                self.tempLabel.text = "\(temp)°"
                self.pressureLable.text = "\(pressure)"
                self.humidityLabel.text = "\(humidity)"
            }
        }
    }
    
    @objc func ChangeCityName (Notification: Notification) {
        if let city = Notification.userInfo?["city"] as? City {
            cityName.text = city.name
            cityId = city.id
            weatheCityInfo()
        }
   
    
}

}
