//
//  ViewController.swift
//  Animation1
//
//  Created by Tanja Keune on 5/26/17.
//  Copyright © 2017 Tanja Keune. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var immage: UIImageView!
    
    var counter = 1
    
    var timer = Timer()
    
    var isAnimating = false
    
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animate(){
        
        immage.image = UIImage(named: "frame_\(counter)_delay-0.07s.gif")
        
        counter += 1
        
        if counter == 6 {
            
            counter = 0
            
        }
    }
    
    @IBAction func next(_ sender: AnyObject) {
       
        if isAnimating {
            
            timer.invalidate()
            
            button.setTitle("Start Animation", for: [])
            
            isAnimating = false
            
        } else {
            
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)
            
            button.setTitle("Stop", for: [])
            
            isAnimating = true
        }
        
        
        
        
       // immage.image = UIImage(named: "frame_0_delay-0.07s.gif")
        
    }

    
    @IBAction func grow(_ sender: AnyObject) {
        
        immage.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) { 
            
            self.immage.frame = CGRect(x: 0 , y: 0, width: 200, height: 200)
        }
    }
    
    @IBAction func slideIn(_ sender: AnyObject) {
        
        immage.center = CGPoint(x: immage.center.x - 500, y: immage.center.y)
        
        UIView.animate(withDuration: 0.5) {
            
                self.immage.center = CGPoint(x: self.immage.center.x + 500, y: self.immage.center.y)
        }
    }
    
    @IBAction func fadeIn(_ sender: AnyObject) {
        
        immage.alpha = 0
        
        UIView.animate(withDuration: 1, animations: {
        
            self.immage.alpha = 1
        })
    }
}

