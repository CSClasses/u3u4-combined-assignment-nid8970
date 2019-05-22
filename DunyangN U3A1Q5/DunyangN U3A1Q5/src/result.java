/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.awt.*;
import java.awt.event.*;
import java.awt.Font;
import java.awt.event.ActionListener;
import javax.swing.*;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.*;
import org.xml.sax.SAXException;
/**
 *
 * @author ndy
 */
public class result extends JFrame implements ActionListener{
    public void readfile(){
        students = new ArrayList<student>();
        student st = null;
            try {
                //read the xml file using the parse, DOM
               DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
               DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
               Document doc = dBuilder.parse("src/studentsresults.xml"); 
               Element rt = doc.getDocumentElement();
               //put each station in the data into a station class
               NodeList stList = rt.getElementsByTagName("student");
               for (int i=0; i<stList.getLength(); i++){
                   //create a new class for each station
                   st = new student();
                   Node nodest = stList.item(i);
                   NodeList tags = nodest.getChildNodes();
                   //read the tags of each station
                   for (int j=0; j<tags.getLength();j++){
                       //set the name of station
                       if(tags.item(j).getNodeName().equals("name")){
                           String name = tags.item(j).getFirstChild().getNodeValue();
                           st.setName(name);
                       }
                       //set the name of identifier
                       else if(tags.item(j).getNodeName().equals("age")){
                           int r_age = Integer.valueOf(tags.item(j).getFirstChild().getNodeValue());
                           st.setAge(r_age);
                       }
                       //set the name of latitude and longitude
                       else if(tags.item(j).getNodeName().equals("math")){
                           Double r_math = Double.valueOf(tags.item(j).getFirstChild().getNodeValue());
                           st.setMath(r_math);
                       }
                       else if(tags.item(j).getNodeName().equals("english")){
                           Double r_eng = Double.valueOf(tags.item(j).getFirstChild().getNodeValue());
                           st.setEng(r_eng);
                       }
                       //set the province and codee
                       else if(tags.item(j).getNodeName().equals("cs")){
                           Double r_cs = Double.valueOf(tags.item(j).getFirstChild().getNodeValue());
                           st.setCS(r_cs);
                       }
                    }
                      
                   students.add(st);   
                }


            }
            catch (FileNotFoundException n){
                System.out.println(n.getMessage());
            }catch (ParserConfigurationException n){
                System.out.println(n.getMessage());
            }catch (SAXException n){
                System.out.println(n.getMessage());
            }catch (IOException n){
                System.out.println(n.getMessage());
            }
    }
    @Override
    public void actionPerformed(ActionEvent e){
        
    
            String bn=e.getActionCommand();
            if (bn.equals("Add")){
                p1.remove(name);
                p1.remove(age);
                p1.remove(math);
                p1.remove(english);
                p1.remove(cs);
                p1.remove(j);
                p1.remove(b1);
                p1.remove(b3);
                p1.remove(b4);
                p1.remove(b5);
                p1.add(b2);
                p1.add(tf_name);
                p1.add(tf_age);
                p1.add(tf_math);
                p1.add(tf_english);
                p1.add(tf_cs);
                validate();
                
            }
            if (bn.equals("OK")){
                if(tf_name.getText().equals("")){
                    System.out.print(tf_name.getText()+"1");
                }
                else{
                    System.out.print(tf_name.getText());
                    try{
                        DocumentBuilder db=dbf.newDocumentBuilder();
                        Document doc=db.parse("src/studentsresults.xml");
                        //create elements
                        Element estu=doc.createElement("student");
                        Element ename=doc.createElement("name");
                        Element eage=doc.createElement("age");
                        Element emath=doc.createElement("math");
                        Element eeng=doc.createElement("english");
                        Element ecs=doc.createElement("cs");

                        String n = tf_name.getText();
                        
                        int a;
                        double m;
                        double en;
                        double cs;
                        //take out invalid inputs
                        try{
                            a = Integer.valueOf(tf_age.getText());
                        } catch(Exception e3){
                            a = -1;
                        }
                        try{
                            m = Double.valueOf(tf_math.getText());
                        } catch(Exception e3){
                            m = -1;
                        }
                        try{
                            en = Double.valueOf(tf_english.getText());
                        } catch(Exception e3){
                            en = -1;
                        }
                        try{
                            cs = Double.valueOf(tf_cs.getText());
                        } catch(Exception e3){
                            cs = -1;
                        }
                        //create texts nodes
                        Text txtname=doc.createTextNode(n);
                        Text txtage=doc.createTextNode(Integer.toString(a));
                        Text txtmath=doc.createTextNode(Double.toString(m));
                        Text txteng=doc.createTextNode(Double.toString(en));
                        Text txtcs=doc.createTextNode(Double.toString(cs));

                        //add texts into elements
                        ename.appendChild(txtname); 
                        eage.appendChild(txtage);
                        emath.appendChild(txtmath);
                        eeng.appendChild(txteng);
                        ecs.appendChild(txtcs);

                        //add elements into the student element
                        estu.appendChild(ename);
                        estu.appendChild(eage);
                        estu.appendChild(emath);
                        estu.appendChild(eeng);
                        estu.appendChild(ecs);
                        //get the root
                        Element eroot=doc.getDocumentElement();
                        //add the element into the file
                        if (!names.contains(n)){
                            eroot.appendChild(estu);
                        }
                        names.add(n);
                        TransformerFactory tff = TransformerFactory.newInstance();
                        Transformer tf = tff.newTransformer();
                        tf.setOutputProperty(OutputKeys.INDENT, "yes");
                        tf.transform(new DOMSource(doc), new StreamResult("src/studentsresults.xml"));
                } 
                    
                catch (Exception e2) {e2.printStackTrace();} 
                }
                
                
                p1.add(name);
                p1.add(age);
                p1.add(math);
                p1.add(english);
                p1.add(cs);
                p1.add(b1);
                p1.add(b3);
                p1.add(b4);
                p1.add(b5);
                p1.remove(b2);
                p1.remove(tf_name);
                p1.remove(tf_age);
                p1.remove(tf_math);
                p1.remove(tf_english);
                p1.remove(tf_cs);
                p1.add(j);
                validate();
            }
            validate();
            repaint();
            if(bn.equals("by Name")){
                Collections.sort(students,new byname());

                for(int i=0;i<students.size();i++){
                    list.addElement(students.get(i).name);
                }
                for(int i=0;i<students.size();i++){
                    list.removeElementAt(0);
                }
                validate();
                repaint();
            }
            else if(bn.equals("by Age")){
                Collections.sort(students,new byage());
                for(int i=0;i<students.size();i++){
                    list.addElement(students.get(i).name);
                }
                for(int i=0;i<students.size();i++){
                    list.removeElementAt(0);
                }
                validate();
                repaint();
            }
            else if(bn.equals("by Math")){
                Collections.sort(students,new bymath());
                for(int i=0;i<students.size();i++){
                    list.addElement(students.get(i).name);
                }
                for(int i=0;i<students.size();i++){
                    list.removeElementAt(0);
                }
                validate();
                repaint();
            }
    }
    public class boxaction implements ActionListener{

        @Override
        public void actionPerformed(ActionEvent e) {
            JComboBox cb = (JComboBox)e.getSource();
            //get the station that is selected
            int i = cb.getSelectedIndex();
            System.out.println(i);
            student s =students.get(i);
            //display values for that student
            name.setText(s.name);
            age.setText(Integer.toString(s.age));
            math.setText(Double.toString(s.math));
            english.setText(Double.toString(s.english));
            cs.setText(Double.toString(s.cs));
            validate();
            repaint();
        }
        
    }
    DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
    private JPanel p1 = new JPanel(null);
    private JLabel l1 = new JLabel("Name:");
    private JLabel l2 = new JLabel("Age:");
    private JLabel l3 = new JLabel("Math");
    private JLabel l4 = new JLabel("English:");
    private JLabel l5 = new JLabel("Computer Science:");
    private JLabel name = new JLabel("");
    private JLabel age = new JLabel("");
    private JLabel math = new JLabel("");
    private JLabel english = new JLabel("");
    private JLabel cs = new JLabel("");
    private Font f = new Font("Arial",0,16);
    private JButton b1 = new JButton("Add");
    private JButton b2 = new JButton("OK");
    private JButton b3 = new JButton("by Name");
    private JButton b4 = new JButton("by Age");
    private JButton b5 = new JButton("by Math");
    private JComboBox j;
    private ArrayList<String> names = new ArrayList<String>();
    java.util.List<student> students = new ArrayList<student>();
    TextField tf_name = new TextField ();
    TextField tf_age = new TextField ();
    TextField tf_math = new TextField ();
    TextField tf_english = new TextField ();
    TextField tf_cs = new TextField ();
    DefaultComboBoxModel list = new DefaultComboBoxModel();
    public static void main(String[] args) {
        // TODO code application logic here
        result a=new result();//create the window
        a.setTitle("Result");
        a.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        a.setSize(450,200);// settings of the window
        a.setVisible(true);
    }
    public result(){
        this.readfile();
        for(int i=0;i<students.size();i++){
            list.addElement(students.get(i).name);
        }
        j = new JComboBox(list);
        j.addActionListener(new boxaction());
        l1.setFont(f);
        l2.setFont(f);
        l3.setFont(f);
        l4.setFont(f);
        l5.setFont(f);
        l1.setBounds(5,40,80,50);//set positions of labels
        name.setBounds(100,40,400,50);
        tf_name.setBounds(100,60,100,20);
        l2.setBounds(5,60,80,50);
        age.setBounds(100,60,100,50);
        tf_age.setBounds(100,80,100,20);
        l3.setBounds(5,80,80,50);
        math.setBounds(100,80,100,50);
        tf_math.setBounds(100,100,100,20);
        l4.setBounds(5,100,80,50);
        english.setBounds(100,100,100,50);
        tf_english.setBounds(100,120,100,20);
        l5.setBounds(210,60,140,50);
        cs.setBounds(370,60,200,50);
        tf_cs.setBounds(350,80,100,20);
        b1.setBounds(320,10,100,30);
        b2.setBounds(320,10,100,30);
        b3.setBounds(320,40,100,30);
        b4.setBounds(220,10,100,30);
        b5.setBounds(220,40,100,30);
        b1.addActionListener(this);
        b2.addActionListener(this);
        b3.addActionListener(this);
        b4.addActionListener(this);
        b5.addActionListener(this);

        j.setBounds(5,10,200,30);
        p1.add(j);
        p1.add(l1);
        p1.add(l2);
        p1.add(l3);
        p1.add(l4);
        p1.add(l5);
        p1.add(name);
        p1.add(age);
        p1.add(math);
        p1.add(english);
        p1.add(cs);
        p1.add(b1);
        p1.add(b3);
        p1.add(b4);
        p1.add(b5);
        add(p1);
    }
}
