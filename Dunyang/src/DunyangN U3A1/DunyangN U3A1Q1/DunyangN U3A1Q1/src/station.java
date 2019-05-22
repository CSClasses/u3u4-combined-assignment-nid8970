/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author ndy
 */
public class station implements Comparable<station>{
    //class to store data
    //setting up variables
    public String name;
    public String identifier;
    public float latitude;
    public float longitude;
    public String province_fr;
    public String province_en;
    public String province_code;
    public float mean_temperature;
    public int mean_daywithout;
    public float difference_from_normal;
    public float max_temperature;
    public int max_daywithout;
    public float min_temperature;
    public int min_daywithout;
    public int snow_daywithout;
    public float snow_p;
    public float snow_total;
    public float snow_normal;
    public int percip_daywithout;
    public float percip_p;
    public float percip_total;
    public int percip_dayswith;
    public float percip_normal;
    public float sunshine_p;
    public float degreedays_cooling;
    public float degreedays_heating;
    public int compareTo(station o){
        //method for comparing and sorting
        if (this.name.compareTo(o.name) > 0) {  
            return 1;  
        }  
        if (this.name.compareTo(o.name) < 0) {  
            return -1;  
        }   
        return 0;  
    }
    //methods for storing data
    public void setName(String name){
        this.name=name;
    }
    public void setIdentifier(String i){
        this.identifier=i;
    }
    public void setLatitude(float i){
        this.latitude=i;
    }
    public void setLongitude(float i){
        this.longitude=i;
    }
    public void setProvince(String fr,String en,String code){
        this.province_fr=fr;
        this.province_en=en;
        this.province_code=code;
    }
    public void setMean_temp(int dayw,float value){
        this.mean_daywithout=dayw;
        this.mean_temperature=value;
    }
    public void setMaxtemp(int dayw,float value){
        this.max_daywithout=dayw;
        this.max_temperature=value;
    }
    public void setMintemp(int dayw,float value){
        this.min_daywithout=dayw;
        this.min_temperature=value;
    }
    public void setSnow(int dayw,float total){
        this.snow_daywithout=dayw;
        this.snow_total=total;
    }
    
    
}
