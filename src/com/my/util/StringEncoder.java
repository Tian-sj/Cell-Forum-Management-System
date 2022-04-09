package com.my.util;



public class StringEncoder {
    public static String inDatabase(String str){
        while(str.indexOf("<")!=-1){
            str = str.substring(0,str.indexOf("<"))+"&lt;"+str.substring(str.indexOf("<")+1);
        }
        while(str.indexOf(">")!=-1){
            str = str.substring(0,str.indexOf(">"))+"&gt;"+str.substring(str.indexOf(">")+1);
        }
        while(str.indexOf("\n")!=-1){
            str = str.substring(0,str.indexOf("\n"))+str.substring(str.indexOf("\n")+1);
        }
        while(str.indexOf(" ")!=-1){
            str = str.substring(0,str.indexOf(" "))+"&nbsp;"+str.substring(str.indexOf(" ")+1);
        }
        return str;
    }
    public static String inTextarea(String str){
        while(str.indexOf("<br>")!=-1){
            str = str.substring(0,str.indexOf("<br>"))+"\n"+str.substring(str.indexOf("<br>")+4);
        }
        while(str.indexOf("&nbsp;")!=-1){
            str = str.substring(0,str.indexOf("&nbsp;"))+" "+str.substring(str.indexOf("&nbsp;")+6);
        }
        while(str.indexOf("&lt;")!=-1){
            str = str.substring(0,str.indexOf("&lt;"))+"<"+str.substring(str.indexOf("&lt;")+4);
        }
        while(str.indexOf("&gt;")!=-1){
            str = str.substring(0,str.indexOf("&gt;"))+">"+str.substring(str.indexOf("&gt;")+4);
        }
        return str;
    }
    public static String inJsp(String str){
        while(str.indexOf("\r")!=-1){
            str = str.substring(0,str.indexOf("\r"))+""+str.substring(str.indexOf("\r")+1);
        }
        while(str.indexOf("\"")!=-1){
            str = str.substring(0,str.indexOf("\""))+"&quot;"+str.substring(str.indexOf("\"")+1);
        }
        return str;
    }
}