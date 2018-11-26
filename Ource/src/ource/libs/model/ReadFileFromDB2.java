package ource.libs.model;

import java.sql.*;
import java.io.*;

public class ReadFileFromDB2{
 private Connection con;
 private Statement stmt;
 private ResultSet rs;
 private String sql="";

 public ReadFileFromDB2() throws SQLException {
  try {
   Class.forName("oracle.jdbc.driver.OracleDriver"); //oracle..
   System.out.println("Driver loading...");
  } catch(ClassNotFoundException e) {
   System.out.println("Exception in constructor");
   e.printStackTrace();
  }
  con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","skcc");
  stmt=con.createStatement();
  System.out.println("\nConnect......");
  
 }
 
 public void close() throws SQLException {
  stmt.close();
  con.close();
 }
 public void go(){
  try{
   FileOutputStream fos = new FileOutputStream("2.gif");
   sql = "SELECT * from testblob where id = 2";
   rs = stmt.executeQuery(sql);
   rs.next();
   System.out.println(rs.getInt(1));
   System.out.println(rs.getString(2));
   InputStream is = rs.getBinaryStream(3);
   //Blob blob = rs.getBlob(3); //다른 방법....
   //InputStream is = blob.getBinaryStream();
   int i = 0;
   while ( (i = is.read()) != -1 ){
    fos.write(i);
   }
   System.out.println("바이너리코드 화일에 저장");
  }catch (SQLException se){
   se.printStackTrace();
   System.out.println("SQLException............");
  }catch (Exception fe){
   fe.printStackTrace();
   System.out.println("Exception............");
  }
 }
 public static void main(String[] args) throws SQLException {
  ReadFileFromDB2 test = new ReadFileFromDB2();
  test.go();
  test.close();
 }
}

