package ource.libs.model;

import java.sql.*;
import java.io.*;

public class WriteFileToDB2{
 private Connection con;
 private Statement stmt;
 private ResultSet rs;
 private String sql="";

 public WriteFileToDB2() throws SQLException {
  try {
   Class.forName("oracle.jdbc.driver.OracleDriver"); 
   System.out.println("Driver loading...");
  } catch(ClassNotFoundException e) {
   System.out.println("Exception in constructor");
   e.printStackTrace();
  }
  con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","skcc");
  System.out.println("\nConnect......");
  
 }
 
 public void close() throws SQLException {
  
  con.close();
 }
 public void go(){
  try{
   sql = "INSERT INTO testblob (id, name, obj) VALUES(?,?,?)";
   PreparedStatement pstmt = con.prepareStatement(sql);//db에 미리 준비된 쿼리문을 넘긴다.
   File file = new File("daum.gif");
   FileInputStream fis = new FileInputStream(file);
   pstmt.setInt(1,2);
   pstmt.setString(2,"이미지");
   pstmt.setBinaryStream(3, fis, (int)file.length()); // setBinaryStream();  //<-- Binary 형태로 DB 에 저장
   pstmt.executeUpdate(); //실행
   System.out.println("insert  실행");
  }catch (SQLException se){
   se.printStackTrace();
   System.out.println("SQLException............");
  }catch (Exception fe){
   fe.printStackTrace();
   System.out.println("Exception............");
  }
 }
 public static void main(String[] args) throws SQLException {
  WriteFileToDB2 test = new WriteFileToDB2();
  test.go();
  test.close();
 }
}
