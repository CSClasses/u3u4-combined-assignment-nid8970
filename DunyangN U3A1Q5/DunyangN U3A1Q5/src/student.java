/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author ndy
 */
public class student implements Comparable<student>{
    public int compareTo(student o){
        if (this.name.compareTo(o.name) > 0) {  
            return 1;  
        }  
        if (this.name.compareTo(o.name) < 0) {  
            return -1;  
        }   
        return 0;  
    }
    public String name;
    public int age;
    public double math;
    public double english;
    public double cs;
    public void setName(String name){
        this.name=name;
    }
    public void setAge(int i){
        this.age=i;
    }
    public void setMath(double i){
        this.math=i;
    }
    public void setEng(double i){
        this.english=i;
    }
    public void setCS(double i){
        this.cs=i;
    }
    
    
}
