//
//  ViewController.swift
//  ex4
//
//  Created by suchuer on 2021/4/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let def = UserDefaults.standard
        let value = def.value(forKey: "lastInputDate")
        if let date = value as? Date{
            let formater = DateFormatter()
            formater.dateFormat = "yyyy-MM-dd HH:mm"
            formater.locale = Locale.init(identifier: "zh-tw")
            let dateString = formater.string(from: date)
            displayLable.text = dateString
        }
    }

    @IBAction func dateselect(_ sender: UIDatePicker) {
        let dateselect = sender.date
        //print(dateselect.timeIntervalSince1970)
        
        let def = UserDefaults.standard
        def.setValue(dateselect, forKey: "lastInputDate")
        def.synchronize()
        
        //text
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd HH:mm"
        formater.locale = Locale.init(identifier: "zh-tw")
        let dateString = formater.string(from: dateselect)
        displayLable.text = dateString
    }
    
}

