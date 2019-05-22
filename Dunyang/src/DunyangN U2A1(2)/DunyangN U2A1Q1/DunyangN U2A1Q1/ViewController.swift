//
//  ViewController.swift
//  DunyangN U2A1Q1
//  Question: write a program that checks the ratings of 5 of my favorite movies and places them in the dictionary and allow users to check for possible entries
//  Created by Dunyang Ni on 2019-04-06.
//  Copyright © 2019 Dunyang Ni. All rights reserved.
//


import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITextFieldDelegate {
    
    
    //Initialize graphic objects
    @IBOutlet weak var l1: UILabel!//the label for title
    @IBOutlet weak var b1: UIButton!//display button
    @IBOutlet weak var b2: UIButton!//return button
    @IBOutlet weak var b3: UIButton!//search button on the start page
    @IBOutlet weak var b4: UIButton!//button for searching
    @IBOutlet weak var table1: UITableView!
    @IBOutlet weak var l2: UILabel!//title in display page
    @IBOutlet weak var l3: UILabel!//note
    @IBOutlet weak var searhfield: UITextField!
    //setting variables and constants
    @objc let mode1 = "display"
    @objc let mode2 = "search"
    @objc let miss = "Not Found"
    @objc let miss2 = "Enter positive numbers!"
    @objc var mode: String = ""
    private var movies: [String] = []
    @objc var result_list: [String] = []
    //helping functions for efficiency
    @objc func ClearStartPage() {//function that help display and search button to clear the start page
        //hide title,button1,button2
        b1.isHidden = true
        b3.isHidden = true
        l1.isHidden = true
    }
    @objc func HidetoReturn() {//function for back buttons
        //hide everything not on the start page
        l2.isHidden = true
        l3.isHidden = true
        table1.isHidden = true
        b2.isHidden = true
        searhfield.isHidden = true
        b4.isHidden = true
    }

    override func viewDidLoad() {
        //setting up variables and objects before the interface is displayed
        super.viewDidLoad()
        let movies_dict = [1:"The Wandering Earth",2:"Avengers: Infinity War",3:"Your Name",4:"The Fast and the Furious",5:"Mission Impossible"]
        for i in 1 ... 5 {
            movies.append(movies_dict[i]!)
        }
        table1.dataSource = self
        searhfield.delegate = self
        //set the properties of the button1
        b1.backgroundColor = UIColor.blue
        b1.setTitle("Display", for: .normal)
        b1.setTitleColor(UIColor.white, for: .normal)
        b1.setTitleColor(UIColor.gray, for: .highlighted)
        b1.layer.cornerRadius = 10
        //set the properties of the button2
        b2.backgroundColor = UIColor.blue
        b2.setTitle("Back", for: .normal)
        b2.setTitleColor(UIColor.white, for: .normal)
        b2.setTitleColor(UIColor.gray, for: .highlighted)
        //set the properties of button3
        b3.backgroundColor = UIColor.blue
        b3.setTitle("Search", for: .normal)
        b3.setTitleColor(UIColor.white, for: .normal)
        b3.setTitleColor(UIColor.gray, for: .highlighted)
        b3.layer.cornerRadius = 10
        b2.layer.cornerRadius = 10
        //set the properties of the title label
        l1.text = "My Favorite Movies"
        l1.font = UIFont.systemFont(ofSize: 30)
        l1.textAlignment = .center
        //set the properties of the title label
        l2.text = "My Favorite Movies"
        l2.font = UIFont.systemFont(ofSize: 30)
        l2.textAlignment = .left
        //initialize the table
        result_list = movies
        self.table1.reloadData()
        //set the textfield
        searhfield.clearButtonMode = .always
        searhfield.textAlignment = .left
        searhfield.placeholder = "Enter the key word or a number"
        //set the searching button
        b4.setTitle("Search", for: .normal)
        b4.setTitleColor(UIColor.lightText, for: .highlighted)
        //set the label3
        l3.text = "Note: Click the space above the textfield to hide the keyboard"
        
        

    }
    
    //implement methods for UItableview
    func numberOfSections(in tableView: UITableView) -> Int {//implement method for UItable
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {//implement method for UItable, number of rows
        return result_list.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //implement method for UItable which set up cells in each row, the same as for .. in
        //works when table1.reloadData is used

        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as! MovieCell //set each cell as a instance of Moviecell which is create in another swift file
        let text = result_list[indexPath.row]
        if mode == mode1 {//set rank labels in display page
            cell.rank.text = "NO.\(indexPath.row+1)"
        }
        else if mode == mode2 {//in searching page
            if !(text == miss || text == miss2) {
                var ra = Int(movies.index(of: text)!)//output searched result and rank
                ra = ra + 1
                cell.rank.text = "NO.\(ra)"
            }
            else {//if "Not found" is printed, there is no rank number
                cell.rank.text = ""
            }
        }
        cell.name.text = "\(text)"
        return cell
    }
    //actions of buttons
    @IBAction func display(_ sender: Any) {//action of the button1
        result_list = movies
        ClearStartPage()
        //display the table and the button2
        table1.isHidden = false
        result_list = movies
        b2.isHidden = false
        l2.isHidden = false
        mode = mode1//set the table to display mode
        self.table1.reloadData()

    }
    @IBAction func search(_ sender: Any) {//action of button3
        ClearStartPage()
        //display textfield, buttons and the table
        result_list=[]
        l3.isHidden = false
        searhfield.isHidden = false
        b2.isHidden = false
        table1.isHidden = false
        b4.isHidden = false
        mode = mode2//set the table to seach mode
        table1.reloadData()

    }
    enum myerror : Error{//my errors for error catching
        case istext(String)
    }
    @IBAction func real_search(_ sender: Any) {
        //action of the search button
        result_list = []
        do {
            guard let num = try Int(searhfield.text!) else {// if input can be convert to integer
                throw myerror.istext("text")
            }
            if  num <= 0 {//if input is 0 or negative number, print the warning
                result_list.append(miss2)
            }
            else if  num <= movies.count {//put the result in the table
                result_list.append(movies[num-1])
            }
            

        } catch  {//when error occur on casting
            for i in movies {//check if any of element in list contain the input
                if i.lowercased().contains(searhfield.text!.lowercased()) {
                    result_list.append(i)
                }
            }
        }
                if result_list.count == 0 {//if there is no output, print"Not Found"
            result_list.append(miss)
        }
        self.table1.reloadData()
        
    }
    @IBAction func back(_ sender: Any) {//action of the button2
        //hide the table and button2
        HidetoReturn()
        //display the title and button1
        b1.isHidden = false
        b3.isHidden = false
        l1.isHidden = false
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {//function to hide the keyboard
        searhfield.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
