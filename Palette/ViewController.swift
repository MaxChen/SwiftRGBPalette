//
//  ViewController.swift
//  Palette
//
//  Created by Max Chen on 2015/5/16.
//  Copyright (c) 2015年 Max Chen. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    @IBOutlet var colorLabel: UILabel!

    @IBAction func doChange(sender: AnyObject) {

//        var slider = sender as! UISlider

        var color = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        self.view.backgroundColor = color

        colorLabel.text = "R:\(Int(redSlider.value * 100)),G:\(Int(greenSlider.value * 100)),B:\(Int(blueSlider.value * 100))"

    }

    func captureColor() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, false, 2)
        UIGraphicsGetImageFromCurrentImageContext()

        self.view.layer.renderInContext(UIGraphicsGetCurrentContext())
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

    @IBAction func doShare(sender: AnyObject) {
        var image = captureColor()
        var compose = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        compose.addImage(image)
        compose.setInitialText("My favorite color!")
        self.presentViewController(compose, animated: true) { () -> Void in

        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

