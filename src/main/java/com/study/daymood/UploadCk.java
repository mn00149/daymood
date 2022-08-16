package com.study.daymood;
 
import java.io.File;
 
public class UploadCk {
  public static synchronized String getUploadDir() {
    String path = "";
    if (File.separator.equals("\\")) {
      path = "D:\\aistudy\\deploy\\ckstorage";
      System.out.println("Windows 10: " + path);
 
    } else {
      // System.out.println("Linux");
      path = "/home/ubuntu/deploy/ckstorage/";
    }
 
    return path;
  }
}
