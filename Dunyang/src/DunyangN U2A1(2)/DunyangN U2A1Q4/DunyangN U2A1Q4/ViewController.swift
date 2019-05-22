//
//  ViewController.swift
//  DunyangN U2A1Q4
//  Question: Create a flowchart and then write a program that uses anythe above listed elements
//  Description: An advance version of Rock-Paper-Scissors.
//  Created by Dunyang Ni on 2019-04-08.
//  Copyright © 2019 Dunyang Ni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var l1: UILabel!//title
    @IBOutlet weak var l2: UILabel!//game result
    @IBOutlet weak var b5: UIButton!//button "Back"
    @IBOutlet weak var t1: UITextView!//introduction
    @IBOutlet weak var cover: UIImageView!//the image on the start page
    @IBOutlet weak var b1: UIButton!//button "Start"
    @IBOutlet weak var b2: UIButton!//button "Introduction"
    @IBOutlet weak var b3: UIButton!//button to start the game
    @IBOutlet weak var b4: UIButton!//button "Restart"
    //buttons for cards
    @IBOutlet weak var cb1: UIButton!
    @IBOutlet weak var cb2: UIButton!
    @IBOutlet weak var cb3: UIButton!
    @IBOutlet weak var cb4: UIButton!
    @IBOutlet weak var cb5: UIButton!
    @IBOutlet weak var cb6: UIButton!
    @IBOutlet weak var cb7: UIButton!
    @IBOutlet weak var cb8: UIButton!
    @IBOutlet weak var cb9: UIButton!
    @objc let sc = "scissors"
    @objc let ro = "rock"
    @objc let pa = "paper"
    @objc var cardlist: [UIButton] = []//setting up variables
    @objc var cardcontents: [String] = []
    @objc var shuffled: [String] = []
    @objc var flipped: [Bool] = []
    @objc var game = false
    @objc var mychoice: String!
    @objc var yourchoice: String!
    
    //helping functions to improve efficiency
    @objc func setbutton(_ button: UIButton) {
        //function to set the properties for buttons
        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.layer.cornerRadius = 10
    }
    @objc func clearStartPage() {
        //function to clear graphic components on the start page
        cover.isHidden = true
        l1.isHidden = true
        b1.isHidden = true
        b2.isHidden = true
    }
    @objc func setCardPosition(x: Int,y: Int){
        //set all of cards o the center of screen
        for i in cardlist {
            i.center.x = CGFloat(x)
            i.center.y = CGFloat(y)
        }
    }
    @objc func shufflecards(arr:[String]) -> [String] {
        //function that return a shuffled list
        var shuffled: [String] = arr
        for i in 1 ..< arr.count {//each elements randomly swap location with another one
            let ind:Int = Int(arc4random())%i
            if ind != i {
                shuffled.swapAt(i, ind)
            }
        }
        return shuffled
    }
    @objc func choose(ord: Int){
        //functions which works when cards are clecked
        if game {//if the value of game is true
            yourchoice = shuffled[ord]//your choice is the card you choose
            clicked(ord: ord)//flip the card
            var my = Int(arc4random_uniform(9))//the program choose a card randomly
            while flipped[my] {
                my = Int(arc4random_uniform(9))
            }
            mychoice = shuffled[my]
            clicked(ord: my)//flip the card
            switch yourchoice {//using "mychoice" and "yourchoice" to see who wins
            case pa:
                switch mychoice {
                case pa:draw()
                case ro:win()
                case sc:lose()
                default:
                    break
                }
            case ro:
                switch mychoice {
                case pa:lose()
                case ro:draw()
                case sc:win()
                default:
                    break
                }
            case sc:
                switch mychoice {
                case pa:win()
                case ro:lose()
                case sc:draw()
                default:
                    break
                }
            default:
                break
            }
        }
    }
    @objc func clicked(ord: Int){//set the choosen card as flipped and change the picture
        if self.flipped[ord] == false {//only works when the card is not flipped
            UIView.transition(with: cardlist[ord].imageView!, duration: 0.5, options: . transitionFlipFromLeft, animations: {
                if self.cardlist[ord].imageView!.image == #imageLiteral(resourceName: "back"){//change the picture and make the animation
                    self.flipped[ord] = true
                    var image: UIImage!
                    switch self.shuffled[ord] {
                        case self.pa : image = #imageLiteral(resourceName: "paper")
                        case self.ro : image = #imageLiteral(resourceName: "rock")
                        case self.sc : image = #imageLiteral(resourceName: "scissor")
                    default: break
                    }
                    self.cardlist[ord].setImage(image, for: .normal)
                }
            }, completion: nil)
        }
    }
    @objc func win(){//if the user wins
        l2.text = "You win!"
        game = false//game is over, so cards cannot be clicked
        l2.isHidden = false
        b4.isHidden = false
    }
    @objc func lose(){//if the user loses
        l2.text = "You Lose!"
        game = false//game is over, so cards cannot be clicked
        l2.isHidden = false
        b4.isHidden = false
    }
    @objc func draw(){//if draw, continue
        l2.text = "Draw, click another card."
        l2.isHidden = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for _ in 1 ... 3 {//set up the list of cards
            cardcontents.append(sc)
            cardcontents.append(ro)
            cardcontents.append(pa)
        }
        for _ in 1 ... 9 {//the list indicates if each card have been flipped
            flipped.append(false)
        }
        l1.textAlignment = .center
        l1.font = UIFont.systemFont(ofSize: 25)
        l1.text = "Rock-Paper-Scissors"
        l2.textAlignment = .center
        //set properties of button
        setbutton(b1)
        setbutton(b2)
        setbutton(b3)
        setbutton(b4)
        setbutton(b5)
        b1.setTitle("Start", for: .normal)
        b2.setTitle("Introduction", for: .normal)
        b3.setTitle("Start", for: .normal)
        b4.setTitle("Restart", for: .normal)
        b5.setTitle("Back", for: .normal)
        //put buttons into the list
        cardlist.append(cb1)
        cardlist.append(cb2)
        cardlist.append(cb3)
        cardlist.append(cb4)
        cardlist.append(cb5)
        cardlist.append(cb6)
        cardlist.append(cb7)
        cardlist.append(cb8)
        cardlist.append(cb9)
        for i in cardlist {
            i.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        }
        
    }
    @IBAction func Intro(_ sender: Any) {//action of the button "Introduction"
        clearStartPage()//clear the start page
        b5.isHidden = false//display return button and the introduction
        t1.isHidden = false
    }
    @IBAction func start(_ sender: Any) {//action of the button "Start" on the start page 
        clearStartPage()//which can change the start page to game page
        setCardPosition(x: 208, y: 310)//set all cards atthe center
        b3.isHidden = false//display buttons
        b5.isHidden = false
        for i in cardlist {//display cards
            i.isHidden = false
        }
        b1.isHidden = true
    }

    @IBAction func gamestart(_ sender: Any) {//action of the button "Start" in game page
        shuffled = shufflecards(arr: cardcontents)//shuffle "cards",set one of "rock","scissor" and "paper" for each card
        UIView.animate(withDuration: 0.5, animations://animation to spread cards
            {   self.cardlist[0].center.x -= 150; self.cardlist[0].center.y -= 200
                self.cardlist[1].center.x -= 0; self.cardlist[1].center.y -= 200
                self.cardlist[2].center.x += 150; self.cardlist[2].center.y -= 200
                self.cardlist[3].center.x -= 150; self.cardlist[3].center.y -= 0
                self.cardlist[4].center.x -= 0; self.cardlist[4].center.y -= 0
                self.cardlist[5].center.x += 150; self.cardlist[5].center.y -= 0
                self.cardlist[6].center.x -= 150; self.cardlist[6].center.y += 200
                self.cardlist[7].center.x -= 0; self.cardlist[7].center.y += 200
                self.cardlist[8].center.x += 150; self.cardlist[8].center.y += 200
                
                
        })
        b3.isHidden = true//hide the button itself
        game = true//set the boolean value as true, so cards are clickable
    }
    @IBAction func restart(_ sender: Any) {//action of the button "Restart"
        b4.isHidden = true//hide the button itself
        b3.isHidden = false//display the "start" button
        l2.isHidden = true//hide the result label
        for i in 0...8 {//reset images for all card buttons
            UIView.transition(with: cardlist[i].imageView!, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                if self.cardlist[i].imageView!.image != #imageLiteral(resourceName: "back"){
                    self.cardlist[i].setImage(#imageLiteral(resourceName: "back"), for: .normal)
                }
            }
                , completion: nil)
        }
        UIView.animate(withDuration: 0.5, animations:{//animation that put all cards together
            self.setCardPosition(x: 208, y: 310)
        })
        shuffled = []//reset variables
        flipped = []
        for _ in 1...9 {
            flipped.append(false)
        }
        
    }
    @IBAction func `return`(_ sender: Any) {//action of button "Return"
        l1.isHidden = false//display graphic components on the start page
        b1.isHidden = false
        b2.isHidden = false
        cover.isHidden = false
        for i in cardlist {//hide cards and everything else
            i.isHidden = true
        }
        b3.isHidden = true
        b4.isHidden = true
        b5.isHidden = true
        l2.isHidden = true
        t1.isHidden = true
        shuffled = []//reset varibles
        flipped = []
        for _ in 1...9 {
            flipped.append(false)
        }
        for i in cardlist {
            i.setImage(#imageLiteral(resourceName: "back"), for: .normal)
        }
        
    }//actions of each card buttons
    @IBAction func cb1(_ sender: Any) { choose(ord: 0)
    }
    @IBAction func cb2(_ sender: Any) {choose(ord: 1)
    }
    @IBAction func cb3(_ sender: Any) {choose(ord: 2)
    }
    @IBAction func cb4(_ sender: Any) {choose(ord: 3)
    }
    @IBAction func cb5(_ sender: Any) {choose(ord: 4)
    }
    @IBAction func cb6(_ sender: Any) {choose(ord: 5)
    }
    @IBAction func cb7(_ sender: Any) {choose(ord: 6)
    }
    @IBAction func cb8(_ sender: Any) {choose(ord: 7)
    }
    @IBAction func cb9(_ sender: Any) {choose(ord: 8)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

