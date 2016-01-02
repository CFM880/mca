package com.example.cfm.flieoperationlibrary;

/**
 * Created by cfm on 16-1-1.
 */
public class FileExtensionName {

    private static final String BIN_FILE_EXTENSION_NAME = "mca";
    private static final String NOR_FILE_EXTENSION_NAME = "pu";



    public static String getFileExtensionName(String filePath){
        String fileKind="";
        int forward_slash = filePath.lastIndexOf('/');
        String fileName = filePath.substring(forward_slash + 1);

       // if ((fileKind !=null) && (fileKind.length()>0)){

            int dot = fileName.lastIndexOf('.');
           // if ((dot > -1)&&(dot < fileName.length()-1)){
                fileKind = fileName.substring(dot +1 );
             //   return fileKind;
            //}

       // }
        return fileKind;
    }

    public static int getFileKind(String filePath){
        String fileExtensionName = getFileExtensionName(filePath);
        int kind = 0;
        if (fileExtensionName.equals(BIN_FILE_EXTENSION_NAME))
        {
            kind = 1;
        }
        if (fileExtensionName.equals(NOR_FILE_EXTENSION_NAME)){
            kind = 2;
        }
        return kind;
    }


}

