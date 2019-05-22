
//setting up variables
var a:Double = 1.0
var integers:[Int] = []
var floats:[Double] = []
var negatives:[Any] = []
var inputs:[Any] = []
while a != 0 {//check if the input is finished
  print("Please enter a number, enter 0 to finish input")
  let input:String = readLine()!//read input
  if let number = Double(input){//if the input is a number
    a = number
    inputs.append(a)
    let deci = a - Double(Int(a))//check if the number is a integer
    if deci == 0{// the number is integer
      let b = Int(a)
      if b>0{//positive,add to integers list
        integers.append(b)
      }
      else if b<0{//negative add to negative list
        negatives.append(b)
      }
      else{
        break//input is 0,finish input
      }
    }
    else {//the number is double
      if a>0{//positive
        floats.append(a)//add to double list
      }
      else if a<0{//negative
        negatives.append(a)//add to negative list
      }
      else{
        break//input is 0,finish input
      }
    }
  }
  else {//input is not a number
    print("invalid input")//warning
  }
}
//output the results
print("All inputs:\(inputs)")
print("Positive Integers:\(integers)")
print("Positive Doubles:\(floats)")
print("negative numbers:\(negatives)")