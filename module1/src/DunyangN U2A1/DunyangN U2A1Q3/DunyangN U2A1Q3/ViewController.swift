//
//  ViewController.swift
//  DunyangN U2A1Q3
//  Question: Create my own bucket list which is a var with type String
//  Requirement: 1.be able to append to it 2.be able to remove fro it. 3.be able to compare with another list
//  Created by Dunyang Ni on 2019-04-07.
//  Copyright © 2019 Dunyang Ni. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var l1: UILabel!//label for the title
    @IBOutlet weak var l2: UILabel!//"Common things we have"
    @IBOutlet weak var l3: UILabel!//note to hide the keyboard
    @IBOutlet weak var image1: UIImageView!//
    @IBOutlet weak var b1: UIButton!//button "Mylist"
    @IBOutlet weak var b2: UIButton!//button "Yourlist"
    @IBOutlet weak var b3: UIButton!//button "Compare"
    @IBOutlet weak var b4: UIButton!//button "Back"
    @IBOutlet weak var tfield: UITextField!
    @IBOutlet weak var b5: UIButton!//button "Search"
    @IBOutlet weak var b6: UIButton!//button "Add"
    @IBOutlet weak var b7: UIButton!//button "Delete"
    @IBOutlet weak var b8: UIButton!//button "Up"
    @IBOutlet weak var b9: UIButton!//button "Down"
    @IBOutlet weak var b10: UIButton!//button "Introduction"
    @IBOutlet weak var t1: UITextView!//introduction text
    //setting upvariables
    var mylist: [String] = []
    var yourlist: [String] = []
    var result_list: [String] = []
    var searched: [String] = []
    var compared: [String] = []
    var selectedRow = -1
    var uping = false
    var downing = false
    var mode: String = ""
    let mode1 = "mylist"
    let mode2 = "yourlist"
    var searching = false
    var comparing = false
    
    //helping functions
    func setbutton(_ button: UIButton) {
        //function to set the properties for buttons
        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.layer.cornerRadius = 10
    }
    func clearStartPage() {//function to clear the start page
        l1.isHidden = true//hide all of objects on the start page
        b1.isHidden = true
        b2.isHidden = true
        b3.isHidden = true
        b10.isHidden = true
        image1.isHidden = true
        b4.isHidden = false
        
    }
    func update(mode: String) {//update the list to the edited list
        if mode == mode1{
            mylist = result_list
        }
        else if mode == mode2 {
            yourlist = result_list
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        //set properties for buttons
        setbutton(b1)
        setbutton(b2)
        setbutton(b3)
        setbutton(b4)
        setbutton(b10)
        b1.setTitle("Mylist", for: .normal)
        b2.setTitle("Yourlist", for: .normal)
        b3.setTitle("Compare", for: .normal)
        b4.setTitle("Back", for: .normal)
        b10.setTitle("Introduction", for: .normal)
        //set properties for the label
        l1.textAlignment = .center
        l1.font = UIFont.systemFont(ofSize: 32)
        l1.text = "The Bucket List"
        l2.textAlignment = .left
        l2.font = UIFont.systemFont(ofSize: 23)
        l2.text = "Common things we have"
        l3.textAlignment = .left
        l3.text = "Note: Click the space above to hide the keyboard!"
        //add things to my list
        mylist.append("Swimming at the center of sea")
        mylist.append("Flying")
        mylist.append("Playing games for 24 hours")
        mylist.append("Travel to Japan")
        mylist.append("Buy a PS5")
        tableView.reloadData()
        
    }
    
    @IBAction func `return` (_ sender: Any) {//action of the button "Back"
        b4.isHidden = true//Hide everything
        b5.isHidden = true
        b6.isHidden = true
        b7.isHidden = true
        b8.isHidden = true
        b9.isHidden = true
        tfield.isHidden = true
        tableView.isHidden = true
        l3.isHidden = true
        t1.isHidden = true
        l1.isHidden = false
        l2.isHidden = true
        b1.isHidden = false//display objects on the start page
        b2.isHidden = false
        b3.isHidden = false
        b10.isHidden = false

        image1.isHidden = false
        mode = ""
        searching = false
        comparing = false
    }
    //buttons in the start page
    @IBAction func Mylist(_ sender: Any) {//action of the button1
        clearStartPage()
        mode = mode1//set the mode to mode1 so the table will load data from mylist
        result_list = mylist
        b4.isHidden = false//display buttons
        b5.isHidden = false
        b6.isHidden = false
        b7.isHidden = false
        b8.isHidden = false
        b9.isHidden = false
        tfield.isHidden = false//display textfield and table
        tableView.isHidden = false
        l3.isHidden = false
        tableView.reloadData()
    }
    @IBAction func Yourlist(_ sender: Any) {//action of button2
        clearStartPage()
        mode = mode2//set the mode to mode1 so the table will load data from yourlist
        result_list = yourlist
        b4.isHidden = false//display buttons
        b5.isHidden = false
        b6.isHidden = false
        b7.isHidden = false
        b8.isHidden = false
        b9.isHidden = false
        tfield.isHidden = false//display textfield and table
        tableView.isHidden = false
        l3.isHidden = false
        tableView.reloadData()
    }
    @IBAction func Search(_ sender: Any) {//action of button "Search"
        searching = true
        if tfield.text! == "" {// if the textfield is empty display everything in the list
            searching = false
            b7.isHidden = false
            b8.isHidden = false
            b9.isHidden = false
            tableView.reloadData()
        }
        else {// texfiekd is not empty, hide edit buttons
            b7.isHidden = true
            b8.isHidden = true
            b9.isHidden = true
        
        for i in result_list {//search
            if i.lowercased().contains(tfield.text!.lowercased()) {
                searched.append(i)
            }

        }
        print(searched)//display results
        tableView.reloadData()
        }
    }
    @IBAction func Compare(_ sender: Any) {//action of the button "Compare"
        clearStartPage()
        tableView.isHidden = false//display thetable
        b4.isHidden = false
        l2.isHidden = false
        comparing = true//change the table to comparing mode so there are no ranks
        compared = []
        for i in mylist{//check if there are any similar things and add those things to a list
            for j in yourlist {
                if i.lowercased().contains(j.lowercased()) || j.lowercased().contains(i.lowercased()) {
                    compared.append(i)
                    compared.append(j)
                    compared.append(" ")
                }
            }
        }
        tableView.reloadData()
    }
    @IBAction func Intro(_ sender: Any) {//action of the button "Introduction"
        clearStartPage()
        b4.isHidden = false//display the introduction
        t1.isHidden = false
        b10.isHidden = true
    }
    //buttons in the list page
    @IBAction func add(_ sender: Any) {//action of the button "Add"
        let input = tfield.text
        if input != "" && !result_list.contains(input!){//if the input is not in the list
            result_list.append(input!)//add it to the list
            tableView.reloadData()
        
        }
        update(mode: mode)
    }
    @IBAction func del(_ sender: Any) {//action of the button "delete"
        if selectedRow != -1 {//if a row is selected
            result_list.remove(at: selectedRow)//remove it from the list
            tableView.reloadData()
            selectedRow = -1
        }
        update(mode: mode)
    }
    @IBAction func up(_ sender: Any) {//action of the button "up"
        if selectedRow != -1 && result_list.count != 1 && selectedRow != 0{//if the selected row is not the first row
            let sub = result_list[selectedRow-1]
            result_list[selectedRow-1] = result_list[selectedRow]
            result_list[selectedRow] = sub//swap the data with data in the above row
            uping = true
            tableView.reloadData()
        }
        update(mode: mode)
    }
    @IBAction func down(_ sender: Any) {//action of the button "down"
        if selectedRow != -1 && result_list.count != 1 && selectedRow < (result_list.count - 1){//if the selected row is not the last row
            let sub = result_list[selectedRow+1]
            result_list[selectedRow+1] = result_list[selectedRow]
            result_list[selectedRow] = sub//swqp the data with data in the row below
            downing = true
            tableView.reloadData()
        }
        update(mode: mode)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {//implement method for UITableview, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{//implement method for UITableview, return the number of rows
            return searched.count//use different list in different mode
        }
        else if comparing {
            return compared.count
        }
        return result_list.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {//return the location of the selected row
        selectedRow = indexPath.row
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //set data in each row, the same as a for ... in loop
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketCell") as! bucketcell //set each cell as a instance of Moviecell which is create in another swift file
        if comparing {//use the list "compared" in comparing mode
            let text = compared[indexPath.row]//read data from the list
            cell.mytext.text = text//set the label
            if indexPath.row%3 == 0 {//set the label that tell user which list the thing is belong to
                cell.rank.text = "Mine"
            }
            else if indexPath.row%3 == 1{
                cell.rank.text = "Your"
            }
            else{
                cell.rank.text = ""
            }
            return cell
        }
        else {//not in comparing mode
            var sub: [String] = []
        
            if searching {//if search button is clicked, turn on the searching mode and read data from the list "Searched"
                sub = result_list
                result_list = searched
            }
            let text = result_list[indexPath.row]//read data from the list
            if !searching{
            cell.rank.text = "NO.\(indexPath.row+1)"}//set the rank number in the label
            else {//read data from my or your list
                var m: [String] = []
                if mode == mode1 {
                    m = mylist
                }
                else if mode == mode2 {
                    m = yourlist
                    }
                var ra = Int(m.index(of: text)!)//output searched result and rank
                ra = ra + 1
                cell.rank.text = "NO.\(ra)"
            }
            cell.mytext.text = text
            //when up or down is clicked, make the selected row follow the change
            if indexPath.row == (selectedRow - 1) && uping {
                tableView.selectRow(at: indexPath, animated: true,  scrollPosition: UITableViewScrollPosition.none)
                selectedRow -= 1
                uping = false
            }
            else if indexPath.row == (selectedRow + 1) && downing {
                tableView.selectRow(at: indexPath, animated: true,  scrollPosition: UITableViewScrollPosition.none)
                selectedRow += 1
                downing = false
            }
            if searching {//after output searched results change the data back to mylist
                result_list = sub
                if indexPath.row == (searched.count - 1){
                searched = []//and clear the list
                }
            }
        }
        return cell
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {//function to hide the keyboard
        tfield.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

