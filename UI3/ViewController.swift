//
//  ViewController.swift
//  UI3
//
//  Created by Nguyen, Le An on 8/7/18.
//  Copyright © 2018 Nguyen, Le An. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        text.delegate = self
    }

    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var myBar: UIProgressView!
    @IBOutlet weak var label: UILabel!
    @IBAction func mySwitch(_ sender: UISwitch) {
        if sender.isOn {
            label.text = "ON"
        } else {
            label.text = "OFF"
        }
    }
    
    @IBAction func Go(_ sender: Any) {
        if text.text != nil {
            let url:URL
            if text.text!.hasPrefix("http://") || text.text!.hasPrefix("https://") {
                url = URL(string:text.text!)!
            } else {
                 url = URL(string: "http://\(text.text!)")!
            }
            UIApplication.shared.open(url, options: ["":""], completionHandler: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        Go(self)
        return false
    }
    
    @IBAction func seg(_ sender: UISegmentedControl) {
        label2.text = sender.titleForSegment(at: sender.selectedSegmentIndex)
    }
    @IBAction func mySlide(_ sender: UISlider) {
        myBar.progress = sender.value
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

