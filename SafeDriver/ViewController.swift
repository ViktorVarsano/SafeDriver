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

    var timer = Timer()
    var scoreTimer = Timer()

    var timerInt = 0
    var scoreInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
 
        scoreInt = 0

        counterLabel.text = String(scoreInt)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

        if timerInt == 0 {
          scoreInt = 0

            startStopButton.setTitle("Restart", for: [])
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

        @objc func  updateScoreTimer() {
         scoreInt += 1

         counterLabel.text = String(scoreInt)
          }
    }
