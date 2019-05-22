/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.Comparator;

/**
 *
 * @author ndy
 */
public class byage implements Comparator<student>{
    public int compare(student o1, student o2) {  
        // TODO Auto-generated method stub  
        if(o1.age > o2.age)  
            return 1;  
        if(o1.age < o2.age)  
            return -1;  
        return 0;
        }  
    }  

