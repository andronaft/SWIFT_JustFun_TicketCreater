//
//  ViewController.swift
//  tick
//
//  Created by andrey on 1/7/19.
//  Copyright © 2019 andrey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var amountprice: UITextField!
    @IBOutlet weak var amountz: UITextField!
    @IBOutlet weak var amountp: UITextField!
    @IBOutlet weak var zonacenter: UITextField!
    @IBOutlet weak var textfilhour: UITextField!
    @IBOutlet weak var zonadown: UITextField!
    @IBOutlet weak var textfilmin: UITextField!
    @IBOutlet weak var textl: UITextField!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var lblzonacenter: UILabel!
    @IBOutlet weak var lblzonadown: UILabel!
    @IBOutlet weak var lblamountp: UILabel!
    @IBOutlet weak var lblamountzona: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lblprice: UILabel!
    var hour = 1
    var minutes = 30
    var sec = 0
    func dateFormatterTest8(){
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MMM.yyyy hh:mm:ss"
        let dateString = dateFormatter.string(from: date as Date)
        lbl2.text = dateString
        //Custom Date Format Sample 3 28/Feb/2016 11:41:51
        
    }
  var timer = Timer()
    
    @IBAction func bt(_ sender: UIButton) {
        hour = Int(textfilhour.text!)!;
        minutes = Int(textfilmin.text!)!;
        view.endEditing(true)
        textfilhour.isHidden = true
        textfilmin.isHidden = true
        textl.isHidden = true
        amountprice.isHidden = true
        amountz.isHidden = true
        amountp.isHidden = true
        zonacenter.isHidden = true
        zonadown.isHidden = true
        lbl3.text = textl.text
        lblzonadown.text = zonadown.text
        lblzonacenter.text = zonacenter.text
        lblamountp.text = amountp.text
        lblamountzona.text = amountz.text
        lblprice.text = "DKK" + amountprice.text! + ".00"
    
        //textl.text = ""
        dateFormatterTest8()
        timer = Timer.scheduledTimer(timeInterval: 1 ,target: self,selector: #selector(ViewController.action),userInfo: nil,repeats: true)
    }
  
    @objc func action(){
        
        sec=sec-1
        if(sec<0){
            sec=59
            minutes=minutes-1
            if(minutes<0){
                minutes=59
                hour=hour-1
            }
        }
        var hourp:String
        var minutesp:String
        var secp:String
        if(hour<10){
            hourp = "0" + String(describing: hour)
        }else{
            hourp = String(describing: hour)
        }
        if(minutes<10){
            minutesp = "0" + String(describing: minutes)
        }else{
            minutesp = String(describing: minutes)
        }
        if(sec<10){
            secp = "0" + String(describing: sec)
        }else{
            secp = String(describing: sec)
        }
        lbl.text = hourp + ":" + minutesp + ":" + secp
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bgground.jpeg")
        self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view, typically from a nib.
    }

}

