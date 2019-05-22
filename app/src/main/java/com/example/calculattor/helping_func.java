package com.example.calculattor;

import java.text.DecimalFormat;

public class helping_func {
    public String add_to_result(String a, String b) {
        if (a.length() < 8) {
            a += b;
            return a;
        } else {
            return a;
        }
    }
    public String convert(double a) {
        DecimalFormat df = new DecimalFormat("#.00");
        String b = df.format(a);
        if (b.length() >= 10) {
            b = b.substring(0, 10);
        }
        return b;
    }
    public Double todouble(String a){
        try {
            Double d=Double.valueOf(a);
            return d;
        } catch (Exception e){
            return -1.;
        }
    }
    public String cancelzero(String a){
        String b;
        if (a.length()>1){
            String h = a.substring(0,1);
            String h2 = a.substring(1,2);
            System.out.println(h);
            System.out.println(h2);
            if(h.equals("0") && h2.equals("0")){
                System.out.println("h");
                b = a.substring(1,a.length());
            }
            else{
                b = a;
            }
        }
        else{
            b = a;
        }
        return b;
    }
}

