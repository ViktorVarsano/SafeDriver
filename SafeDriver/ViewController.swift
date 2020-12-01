//  ViewController.swift
//  SafeDriver
//
//  Created by Viktor Varsano on 28.09.20.
//  Copyright © 2020 Viktor Varsano. All rights reserved.
//
import UIKit

    

    class ViewController: UIViewController {

    @IBOutlet weak var trafficLight: UIImageView!
    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var startStopButton: UIButton!
    @IBOutlet weak var enjoyDrivingLabel: UILabel!
        
    var timer = Timer()
    var scoreTimer = Timer()

    var timerInt = 0
    var scoreInt = 0
         
    override func viewDidLoad() {
        super.viewDidLoad()
        enjoyDrivingLabel.alpha = 0
        
        scoreInt = 0

        counterLabel.text = String(scoreInt)
    }

    @IBAction func StartStop(_ sender: AnyObject) {
            if scoreInt == 0 {

            timerInt = 3

            trafficLight.image = UIImage(named: "TrafficLight")

            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)

            startStopButton.isEnabled = false
            startStopButton.setTitle("", for: [])

            scoreInt = 0

            counterLabel.text = String(scoreInt)

        } else {
            scoreTimer.invalidate()
        }

        let metersDistance = 0

        if timerInt == 0 {
          scoreInt = 0
            
            startStopButton.setTitle("Restart", for: [])


            if let metersDistance = Int(counterLabel!.text ?? "") {

                print(Float(metersDistance) * Float(0.16667))
                let brakeDistance = (Float(metersDistance) * Float(0.16667))
                let formattedBrakeDistance = String(format: "%.2f", brakeDistance)
            

            enjoyDrivingLabel.alpha = 1
            enjoyDrivingLabel.text = "Do You Enjoy Driving?\n  We hope you do as much as we do!\n With an average of speed of 60 km/h, your reaction time causes you brake distance of \(formattedBrakeDistance) meters"
            }
        }
    }
        
        @objc func updateCounter() {
            timerInt -= 1

        if timerInt == 2 {

                trafficLight.image = UIImage(named: "TrafficLight3")
         
        } else if timerInt == 1 {

            trafficLight.image = UIImage(named: "TrafficLight2")

            startStopButton.setTitle("Stop", for: [])

        } else if timerInt == 0 {

            trafficLight.image = UIImage(named: "TrafficLight1")

            timer.invalidate()

            startStopButton.isEnabled = true

            scoreTimer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(ViewController.updateScoreTimer), userInfo: nil, repeats: true)
            
        }
    }

        @objc func updateScoreTimer() {
         scoreInt += 1

         counterLabel.text = String(scoreInt)
        }
        

}
