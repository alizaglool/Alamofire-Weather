//
//  ChangeCity.swift
//  Alamofire-Weather
//
//  Created by Zaghloul on 04/09/2022.
//

import UIKit

class ChangeCity: UIViewController {
    
    @IBOutlet weak var pickerCity: UIPickerView!
    
    var arrCity = [City(name: "Riyadh", id: "108410"),
                   City(name: "London", id: "1006984"),
                   City(name: "Paris", id: "2634065"),
                   City(name: "Egypt", id: "4154280"),
                   City(name: "Cario", id: "360630")
    ]
    
    var selectCity: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerCity.delegate = self
        pickerCity.dataSource = self
    }
    
    @IBAction func changeCityName(_ sender: UIButton) {
        if let city = selectCity {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ChangeCity"), object: nil, userInfo: ["city": city])
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
}
extension ChangeCity: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrCity.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrCity[row].name
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectCity = arrCity[row]
    }
    
}
