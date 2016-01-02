package com.example.cfm.flieoperationlibrary;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.util.Scanner;

/**
 * Created by cfm on 16-1-1.
 */
public class ReadDataFromFile {
    private static Scanner input;

    public int[] readDataFromBinFile(String filePath){
        int[] data = new int[1024];
        try
        {
            FileInputStream fis=new FileInputStream(filePath);
            DataInputStream dis = new DataInputStream(fis);
            dis.skipBytes(230);

            System.out.println(dis.available());
            int i = 0;
            while (dis.available()>0){
                int t = dis.readInt();// read 4 bytes
                t = (0x000000ff & (t>>24)) |
                        (0x0000ff00 & (t>> 8)) |
                        (0x00ff0000 & (t<< 8)) |
                        (0xff000000 & (t<<24));
                data[i] = t;
                i++;
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return data;

    }

    public float[] readDataFromNorFile(String filePath){
        float[] data = new float[2048];
        File file = new File(filePath);

        try
        {
            BufferedReader br = new BufferedReader(new FileReader(file));
            String line;

           // System.out.println(br.toString());

            int i = 0;
            while ((line = br.readLine())!= null){
                float t = Float.parseFloat(line);
                data[i] = t;
                i++;
                if (i == 2048){
                    break;
                }
            }

        } catch (Exception e)
        {
            e.printStackTrace();
        }
        return data;
    }

//    public Object[] readDataFromFile(String filePath){
//        int k = FileExtensionName.getFileKind(filePath);
//
//        if (k == 0){
//            String str = "文件类型不支持";
//            char[] strChar = str.toCharArray();
//            return (Object)strChar;
//        }
//
//    }
}
