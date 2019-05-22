//
//  ViewController.swift
//  DunyangN U2A1Q2
//  Question: Create a flowchart and write a program to playthe game craps.
//  Created by Dunyang Ni on 2019-04-06.
//  Copyright © 2019 Dunyang Ni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //setting up graphic components
    @IBOutlet weak var l1: UILabel!//label for title
    @IBOutlet weak var l2: UILabel!//label for displaying the sum
    @IBOutlet weak var l3: UILabel!//label for displaying point or result
    @IBOutlet weak var b1: UIButton!//button to startthe game
    @IBOutlet weak var b2: UIButton!//button for openning the introduction
    @IBOutlet weak var b3: UIButton!//return button    
    @IBOutlet weak var b4: UIButton!//roll button
    @IBOutlet weak var b5: UIButton!// Restart button
    @IBOutlet weak var t1: UITextView!//introductions
    @IBOutlet weak var t2: UITextView!
    @IBOutlet weak var image1: UIImageView!//images for dices
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!//image on the start page
    @objc var point = 0
    @objc func setbutton(_ button: UIButton) {
        //function to set the properties for buttons
        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.layer.cornerRadius = 10
    }
    @objc func clearStartPage() {//function to clear the start page
        l1.isHidden = true
        b1.isHidden = true
        b2.isHidden = true
        image3.isHidden = true
        b3.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting properties for label1
        l1.textAlignment = .center
        l1.font = UIFont.systemFont(ofSize: 50)
        l1.text = "Craps"
        //setting properties for label2 and 3
        l2.textAlignment = .left
        l2.font = UIFont.systemFont(ofSize: 30)
        l3.textAlignment = .center
        l3.font = UIFont.systemFont(ofSize: 25)
        //set properties for buttons
        setbutton(b1)
        b1.setTitle("Start", for: .normal)
        setbutton(b2)
        b2.setTitle("Introduction", for: .normal)
        setbutton(b3)
        b3.setTitle("Back", for: .normal)
        setbutton(b4)
        b4.setTitle("Roll", for: .normal)
        setbutton(b5)
        b5.setTitle("Restart", for: .normal)
        image3.image = #imageLiteral(resourceName: "dices")
        
        
    }

    @IBAction func start(_ sender: Any) {// action of the button "Start"
        clearStartPage()
        b3.isHidden = false//display the button "roll" and "back"
        b4.isHidden = false
        point = 0//reset the point
    }
    @IBAction func intro(_ sender: Any) {// action of the button "Introduction"
        clearStartPage()
        t1.isHidden = false//display introductions
        t2.isHidden = false
    }
    @IBAction func back(_ sender: Any) {// action of the button "Back"
        t1.isHidden = true//hide everything in intro page or game page
        t2.isHidden = true
        b3.isHidden = true
        b4.isHidden = true
        b5.isHidden = true
        image1.isHidden = true
        image2.isHidden = true
        l2.isHidden = true
        l3.isHidden = true
        
        l1.isHidden = false//display title,image,and buttons
        b1.isHidden = false
        b2.isHidden = false
        image3.isHidden = false
    }
    //fuctions for the game
    @objc func rollDice(num: Int) -> UIImage {
        //get a generated number between 1-6, and return the corresponding dice image
        var image: UIImage!
        switch num {
        case 1:
            image = UIImage(named: "Dice-1")!
        case 2:
            image = UIImage(named: "Dice-2")!
        case 3:
            image = UIImage(named: "Dice-3")!
        case 4:
            image = UIImage(named: "Dice-4")!
        case 5:
            image = UIImage(named: "Dice-5")!
        case 6:
            image = UIImage(named: "Dice-6")!
        default: break
        }
        return image
    }
    @objc func lose() {//if the user lose
        l3.text = "You Lose!"
        l3.isHidden = false//prit the result
        point = 0
        b4.isHidden = true
        b5.isHidden = false
    }
    @objc func win() {//if the user win
        l3.text = "You Win!"
        l3.isHidden = false//print the result
        point = 0
        b4.isHidden = true//replace the "Roll" button with the "Restart"
        b5.isHidden = false
    }
    @IBAction func roll(_ sender: Any) {//action of the button "Roll"
        let num1 = arc4random_uniform(6)+1//generate two random numbers between 1-6
        let num2 = arc4random_uniform(6)+1
        let sum = Int(num1) + Int(num2)
        image1.image = rollDice(num: Int(num1))//display corresponding images
        image2.image = rollDice(num: Int(num2))
        l2.text = "The sum is \(sum)"
        l2.isHidden = false
        image1.isHidden = false
        image2.isHidden = false
        if point == 0 {//first roll
            switch sum {//win when sum is 7,11
            case 2: lose()//lose when sum is 2,3,12
            case 3: lose()
            case 7: win()
            case 11: win()
            case 12: lose()
            default://otherwise, point = sum
                point = sum
                l3.text = "Your point is \(point)"
                l3.isHidden = false
            }
        }
        else {//not the first roll
            if sum == 7 {//lose when sum is 7
                lose()
            }
            else if sum == point {//win when sum is equal to the point
                win()
            }
        }
        
    }
    @IBAction func restart(_ sender: Any) {//actionof the button "Restart" in the gamepage
        //hide images and labels, and replace this button with "Roll"
        l2.isHidden = true
        l3.isHidden = true
        image1.isHidden = true
        image2.isHidden = true
        b5.isHidden = true
        b4.isHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

