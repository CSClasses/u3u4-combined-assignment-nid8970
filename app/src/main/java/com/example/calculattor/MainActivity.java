package com.example.calculattor;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    helping_func h = new helping_func();//import helping functions
    //setting up variables
    private double result;//value for the amount
    private double result1;//value for the tip
    private double result2;//value for the total
    private String result_t="";//text for the amount
    private String result_t1="";//text for the tip
    private String result_t2="";//text for the total
    private TextView t;
    private TextView t1;
    private TextView t2;
    private TextView tip_t;
    private double tip = 0.15;
    private Button bt;
    String tt = "tip（%"+Double.toString(tip*100)+")";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        //connect the textviews to the program
        t=findViewById(R.id.result);//connect the output textview to this file
        t1=findViewById(R.id.result2);
        t2=findViewById(R.id.result3);
        tip_t=findViewById(R.id.tip);

        System.out.println(tt);
        tip_t.setText(tt);
        //set actions for all of buttons
        findViewById(R.id.button0).setOnClickListener(new View.OnClickListener() {
            //action for the number 0
            @Override
            public void onClick(View v) {
                result_t=h.add_to_result(result_t,"0");//add 0 the the end of amount string
                result_t=h.cancelzero(result_t);//cancel 0s at the beginning of the string
                t.setText(result_t);//display the string
                result=h.todouble(result_t);//convert the string to the number
            }
        });
        findViewById(R.id.button).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the number 1
                result_t=h.add_to_result(result_t,"1");//add 1 the the end of amount string
                result_t=h.cancelzero(result_t);//cancel 0s at the beginning of the string
                t.setText(result_t);//display the string
                result=h.todouble(result_t);//convert the string to the number
            }
        });
        findViewById(R.id.button2).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the number 2
                result_t=h.add_to_result(result_t,"2");//add 2 the the end of amount string
                result_t=h.cancelzero(result_t);//cancel 0s at the beginning of the string
                t.setText(result_t);//display the string
                result=h.todouble(result_t);//convert the string to the number
            }
        });
        findViewById(R.id.button3).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the number 3
                result_t=h.add_to_result(result_t,"3");//add 3 the the end of amount string
                result_t=h.cancelzero(result_t);//cancel 0s at the beginning of the string
                t.setText(result_t);//display the string
                result=h.todouble(result_t);//convert the string to the number
            }
        });
        findViewById(R.id.button4).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the number 4
                result_t=h.add_to_result(result_t,"4");//add 4 the the end of amount string
                result_t=h.cancelzero(result_t);//cancel 0s at the beginning of the string
                t.setText(result_t);//display the string
                result=h.todouble(result_t);//convert the string to the number
            }
        });
        findViewById(R.id.button5).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the number 5
                result_t=h.add_to_result(result_t,"5");//add 5 the the end of amount string
                result_t=h.cancelzero(result_t);//cancel 0s at the beginning of the string
                t.setText(result_t);//display the string
                result=h.todouble(result_t);//convert the string to the number
            }
        });
        findViewById(R.id.button6).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the number 6
                result_t=h.add_to_result(result_t,"6");//add 6 the the end of amount string
                result_t=h.cancelzero(result_t);//cancel 0s at the beginning of the string
                t.setText(result_t);//display the string
                result=h.todouble(result_t);//convert the string to the number
            }
        });
        findViewById(R.id.button7).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the number 7
                result_t=h.add_to_result(result_t,"7");//add 7 the the end of amount string
                result_t=h.cancelzero(result_t);//cancel 0s at the beginning of the string
                t.setText(result_t);//display the string
                result=h.todouble(result_t);//convert the string to the number
            }
        });
        findViewById(R.id.button8).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the number 8
                result_t=h.add_to_result(result_t,"8");//add 8 the the end of amount string
                result_t=h.cancelzero(result_t);//cancel 0s at the beginning of the string
                t.setText(result_t);//display the string
                result=h.todouble(result_t);//convert the string to the number
            }
        });
        findViewById(R.id.button9).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the number 9
                result_t=h.add_to_result(result_t,"9");//add 9 the the end of amount string
                result_t=h.cancelzero(result_t);//cancel 0s at the beginning of the string
                t.setText(result_t);//display the string
                result=h.todouble(result_t);//convert the string to the number
            }
        });
        findViewById(R.id.decimal).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the decimal
                result_t=h.add_to_result(result_t,".");//add "." the the end of amount string
                result_t=h.cancelzero(result_t);//cancel 0s at the beginning of the string
                t.setText(result_t);//display the string
                result=h.todouble(result_t);//convert the string to the number
            }
        });
        findViewById(R.id.b_ok).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the ok button
                result=h.todouble(result_t);//convert the text to number
                if (result == -1.) {//if convertion failed
                    result_t="Invalid Input";
                    t.setText(result_t);
                }
                else {
                    //calculate tip and total, and display results
                    result1 = result * tip;
                    result_t1 = h.convert(result1);
                    t1.setText(result_t1);
                    result2 = result * (1 + tip);
                    result_t2 = h.convert(result2);
                    t2.setText(result_t2);
                }
            }
        });
        findViewById(R.id.back).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //action for the button back
                if(result_t.length()>0){
                    //delete the last letter entered and edit texts and values
                    result_t=result_t.substring(0,result_t.length()-1) ;
                    result_t=h.cancelzero(result_t);
                    t.setText(result_t);
                    result=h.todouble(result_t);
                }
            }
        });
        findViewById(R.id.button11).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //actions for the button clear
                //reset all of texts and values
                result_t="";
                result = 0;
                result_t1 = "";
                result1=0;
                result_t2="";
                result2=0;
                t.setText(result_t);
                t1.setText(result_t1);
                t2.setText(result_t2);
            }
        });
        findViewById(R.id.p15).setOnClickListener(new View.OnClickListener() {
            //action for the button %15
            @Override
            public void onClick(View v) {
                //change the tip to 0.15, and display
                tip=0.15;
                tt="tip（%"+Double.toString(tip*100)+")";
                tip_t.setText(tt);
            }
        });
        findViewById(R.id.customtip).setOnClickListener(new View.OnClickListener() {
            //action for the button "%"
            @Override
            public void onClick(View v) {
                //change the value of tip, and the text of corresponding labels
                tip=result/100;
                tt="tip（%"+Double.toString(result)+")";
                tip_t.setText(tt);
                result_t="";
                result = 0;
                result_t1 = "";
                result1=0;
                result_t2="";
                result2=0;
                t.setText(result_t);
                t1.setText(result_t1);
                t2.setText(result_t2);
            }
        });
        findViewById(R.id.help).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this,helpingpage.class));
            }
        });


    }
}

