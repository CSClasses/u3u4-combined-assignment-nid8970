//
//  ViewController.swift
//  DunyangN U3A1Q4
//
//  Created by 倪敦阳 on 19/05/2019.
//  Copyright © 2019 倪敦阳. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var up: UIButton!
    @IBOutlet weak var left: UIButton!
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var down: UIButton!
    @IBOutlet weak var up_a1: UIButton!
    @IBOutlet weak var up_a2: UIButton!
    
    @IBOutlet weak var right_image: UIImageView!
    @IBOutlet weak var up_image: UIImageView!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var down_image: UIImageView!
    @IBOutlet weak var up_question: UILabel!
    @IBOutlet weak var down_question: UILabel!
    @IBOutlet weak var down_answer: UITextField!
    @IBOutlet weak var down_ok: UIButton!
    @IBOutlet weak var right_question: UILabel!
    @IBOutlet weak var right_answer1: UIButton!
    @IBOutlet weak var right_answer2: UIButton!
    @IBOutlet weak var right_answer3: UIButton!
    @IBOutlet weak var left_image: UIImageView!
    @IBOutlet weak var left_question: UILabel!
    @IBOutlet weak var left_answer: UITextField!
    @IBOutlet weak var left_ok: UIButton!
    func setbutton(_ button: UIButton) {
        //function to set the properties for buttons
        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.layer.cornerRadius = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setbutton(up_a1)
        setbutton(up_a2)
        setbutton(down_ok)
        setbutton(right_answer1)
        setbutton(right_answer2)
        setbutton(right_answer3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func clearthescreen() {
        up.isHidden = true
        left.isHidden = true
        right.isHidden = true
        down.isHidden = true
        result.isHidden = true
    }
    func reset() {
        up.isHidden = false
        left.isHidden = false
        right.isHidden = false
        down.isHidden = false
        result.isHidden = false
        up_image.isHidden = true
        up_question.isHidden = true
        up_a1.isHidden = true
        up_a2.isHidden = true
        down_image.isHidden = true
        down_question.isHidden = true
        down_answer.isHidden = true
        down_ok.isHidden = true
        right_image.isHidden = true
        right_question.isHidden = true
        right_answer1.isHidden = true
        right_answer2.isHidden = true
        right_answer3.isHidden = true
        left_image.isHidden = true
        left_question.isHidden = true
        left_answer.isHidden = true
        left_ok.isHidden = true
    }


    
    @IBAction func up_a(_ sender: UIButton) {
        clearthescreen()
        up_image.isHidden = false
        up_question.isHidden = false
        up_a1.isHidden = false
        up_a2.isHidden = false
    }
    @IBAction func up_answer1(_ sender: UIButton) {
        result.text = "Correct!"
        reset()
    }
    @IBAction func up_answer2(_ sender: UIButton) {
        result.text = "Wrong!"
        reset()
    }
    @IBAction func left_a(_ sender: UIButton) {
        clearthescreen()
        left_image.isHidden = false
        left_question.isHidden = false
        left_answer.isHidden = false
        left_ok.isHidden = false
    }
    @IBAction func left_ok_a(_ sender: UIButton) {
        if down_answer.text!.lowercased() == "clock" {
            result.text = "Correct!"
            reset()
        }
        else {
            result.text = "Wrong!"
            reset()
        }
    }
    @IBAction func right_a(_ sender: UIButton) {
        clearthescreen()
        right_image.isHidden = false
        right_question.isHidden = false
        right_answer1.isHidden = false
        right_answer2.isHidden = false
        right_answer3.isHidden = false
    }
    @IBAction func right_answer1_a(_ sender: UIButton) {
        result.text = "Wrong!"
        reset()
    }
    @IBAction func right_answer2_a(_ sender: UIButton) {
        result.text = "Wrong!"
        reset()
    }
    @IBAction func right_answer3_a(_ sender: UIButton) {
        result.text = "Correct!"
        reset()
    }
    
   
    @IBAction func down_a(_ sender: UIButton) {
        clearthescreen()
        down_image.isHidden = false
        down_question.isHidden = false
        down_answer.isHidden = false
        down_ok.isHidden = false
    }
    @IBAction func down_ok_a(_ sender: UIButton) {
        if down_answer.text! == "1000" {
            result.text = "Correct!"
            reset()
        }
        else {
            result.text = "Wrong!(The answer is 1000)"
            reset()
        }
    }

}

