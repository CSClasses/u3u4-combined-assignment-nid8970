/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *Dunyang Ni
 *May 15 2019
 *write a program to input a
 *txt file (or xml file) of weather data.
 * @author ndy
 */
import org.w3c.dom.*;
import org.xml.sax.SAXException;
 
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.awt.print.Book;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Collections;  

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.JFrame;
import java.util.Vector;
public class weather extends JFrame implements ActionListener{
    /**
     * @param args the command line arguments
     */
    //initialize labels
    private JPanel p1;
    private JLabel l1;
    private JLabel l2;
    private JLabel l3;
    private JLabel l4;
    private JLabel l5;
    private JLabel l6;
    private JLabel l7;
    private JLabel l8;

    //setting up labels for values
    private JLabel name = new JLabel("");
    private JLabel identifier = new JLabel("");
    private JLabel latitude = new JLabel("");
    private JLabel longitude = new JLabel("");
    private JLabel max_temp = new JLabel("");
    private JLabel min_temp = new JLabel("");
    private JLabel province = new JLabel("");
    private JLabel mean_temp = new JLabel("");
    private Font f = new Font("Arial",0,16);
    private JComboBox j;
    //settinf up variables
    List<station> stations = new ArrayList<station>();
    
    public void actionPerformed(ActionEvent e){
        //the action for the combobox
            JComboBox cb = (JComboBox)e.getSource();
            //get the station that is selected
            int i = cb.getSelectedIndex();
            station s =stations.get(i);
            //display values for that station
            name.setText(s.name);
            identifier.setText(s.identifier);
            latitude.setText(Float.toString(s.latitude));
            longitude.setText(Float.toString(s.longitude));
            max_temp.setText(Float.toString(s.max_temperature));
            min_temp.setText(Float.toString(s.min_temperature));
            mean_temp.setText(Float.toString(s.mean_temperature));
            province.setText(s.province_code);
            validate();
            
    }
    public static void main(String[] args) {
        // TODO code application logic here
        weather a=new weather();//create the window
        a.setTitle("Weather");
        a.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        a.setSize(450,200);// settings of the window
        a.setVisible(true);
    }
    public weather() {
        
        station st = null;
        try {
            //read the xml file using the parse, DOM
           DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
           DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
           Document doc = dBuilder.parse("src/data.xml"); 
           Element rt = doc.getDocumentElement();
           //put each station in the data into a station class
           NodeList stList = rt.getElementsByTagName("station");
           for (int i=0; i<stList.getLength(); i++){
               //create a new class for each station
               st = new station();
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
                   else if(tags.item(j).getNodeName().equals("identifier")){
                       st.setIdentifier(tags.item(j).getFirstChild().getNodeValue());
                   }
                   //set the name of latitude and longitude
                   else if(tags.item(j).getNodeName().equals("latitude")){
                       float lat = Float.valueOf(tags.item(j).getFirstChild().getNodeValue());
                       st.setLatitude(lat);
                   }
                   else if(tags.item(j).getNodeName().equals("longitude")){
                       float log = Float.valueOf(tags.item(j).getFirstChild().getNodeValue());
                       st.setLongitude(log);
                       System.out.println(log);
                   }
                   //set the province and codee
                   else if(tags.item(j).getNodeName().equals("province")){
                       NamedNodeMap attrs = tags.item(j).getAttributes();
                       String fr = "";
                       String en= "";
                       String code = "";
                       for (int k=0;k<attrs.getLength();k++){
                           Node attr = attrs.item(k);
                           switch (attr.getNodeName()){
                               case "french": fr = attr.getNodeValue();break;
                               case "english": en = attr.getNodeValue();break;
                               case "code": code = attr.getNodeValue();break;
                           }
                       }
                       st.setProvince(fr, en, code);
                   }
                   //set maximum,minimum and mean temperature
                   else if(tags.item(j).getNodeName().equals("max_temperature")){
                       try {
                            NamedNodeMap attrs = tags.item(j).getAttributes();
                            float value=-1;
                            int dayw= 0;
                            //get the value of attributes for that tag
                            for (int k=0;k<attrs.getLength();k++){
                                Node attr = attrs.item(k);
                                switch (attr.getNodeName()){
                                    case "value": value = Float.valueOf(attr.getNodeValue());break;
                                    case "dayswithoutvalidmeasure": dayw = Integer.valueOf(attr.getNodeValue());break;
                                }
                            }
                            if(attrs.getLength()!=0){
                                st.setMaxtemp(dayw, value);
                            }
                       } catch(Exception e){
                           break;
                       }
                   }
                   else if(tags.item(j).getNodeName().equals("mean_temperature")){
                       try {
                            NamedNodeMap attrs = tags.item(j).getAttributes();
                            float value=-1;
                            int dayw= 0;
                            //get the value of attributes for that tag
                            for (int k=0;k<attrs.getLength();k++){
                                Node attr = attrs.item(k);
                                switch (attr.getNodeName()){
                                    case "value": value = Float.valueOf(attr.getNodeValue());break;
                                    case "dayswithoutvalidmeasure": dayw = Integer.valueOf(attr.getNodeValue());break;
                                }
                            }
                            if(attrs.getLength()!=0){
                                st.setMean_temp(dayw,value);
                            }
                       } catch(Exception e){
                           break;
                       }
                   }
                   else if(tags.item(j).getNodeName().equals("min_temperature")){
                       try {
                            NamedNodeMap attrs = tags.item(j).getAttributes();
                            float value=-1;
                            int dayw= 0;
                            //get the value of attributes for that tag
                            for (int k=0;k<attrs.getLength();k++){
                                Node attr = attrs.item(k);
                                switch (attr.getNodeName()){
                                    case "value": value = Float.valueOf(attr.getNodeValue());break;
                                    case "dayswithoutvalidmeasure": dayw = Integer.valueOf(attr.getNodeValue());break;
                                }
                            }
                            if(attrs.getLength()!=0){
                                st.setMintemp(dayw, value);
                            }
                       } catch(Exception e){
                           break;
                       }
                   }
               }
               stations.add(st);   
           }

            
        }
        catch (FileNotFoundException e){
            System.out.println(e.getMessage());
        }catch (ParserConfigurationException e){
            System.out.println(e.getMessage());
        }catch (SAXException e){
            System.out.println(e.getMessage());
        }catch (IOException e){
            System.out.println(e.getMessage());
        }
        
        Collections.sort(stations);
        String[] s = new String[stations.size()];
        for(int i=0;i<stations.size();i++){
            s[i]=stations.get(i).name;
        }
        setLayout(new GridLayout(1,1, 5, 5));//set the window
        j = new JComboBox(s);
        j.addActionListener(this);
        p1=new JPanel(null);//initialize variables
        l1=new JLabel("Name:");//setting up labels
        l2=new JLabel("Identifier:");
        l3=new JLabel("Latitude:");
        l4=new JLabel("Longitude:");
        l5=new JLabel("Province:");
        l6=new JLabel("Highest Temperature:");
        l7=new JLabel("Lowest Temperature:");
        l8=new JLabel("Average Temperature:");
        //set the fonts for all of labels
        l1.setFont(f);
        l2.setFont(f);
        l3.setFont(f);
        l4.setFont(f);
        l5.setFont(f);
        l6.setFont(f);
        l7.setFont(f);
        l8.setFont(f);
        name.setFont(f);
        province.setFont(f);
        longitude.setFont(f);
        latitude.setFont(f);
        identifier.setFont(f);
        max_temp.setFont(f);
        min_temp.setFont(f);
        mean_temp.setFont(f);
        j.setBounds(5,10,200,30);
        l1.setBounds(5,40,100,50);//set positions of labels
        name.setBounds(100,40,400,50);
        l2.setBounds(5,60,100,50);
        identifier.setBounds(100,60,100,50);
        l3.setBounds(5,80,100,50);
        latitude.setBounds(100,80,100,50);
        l4.setBounds(5,100,100,50);
        longitude.setBounds(100,100,100,50);
        l5.setBounds(210,5,200,50);
        province.setBounds(370,5,200,50);
        l6.setBounds(190,60,200,50);
        max_temp.setBounds(370,60,200,50);
        l7.setBounds(190,80,200,50);
        min_temp.setBounds(370,80,200,50);
        l8.setBounds(190,100,200,50);
        mean_temp.setBounds(370,100,200,50);
        //add components to the panel
        p1.add(j);
        p1.add(l1);
        p1.add(l2);
        p1.add(l3);
        p1.add(l4);
        p1.add(l5);
        p1.add(l6);
        p1.add(l7);
        p1.add(l8);
        p1.add(name);
        p1.add(identifier);
        p1.add(province);
        p1.add(latitude);
        p1.add(longitude);
        p1.add(max_temp);
        p1.add(min_temp);
        p1.add(mean_temp);
        add(p1);//add panel to the window

    }
    
}
