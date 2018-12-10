<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="java.io.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<fmt:requestEncoding value="utf-8" />
<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
					url="jdbc:oracle:thin:@52.79.235.41:1521:xe" 
					user="ource" 
					password="ourvoice"
					var="conn"/>
<c:catch var="error">
	 <sql:query dataSource = "${conn}" var = "profile">
            select profile_img, background_img from user_profile_img where user_id=?
            <sql:param>${sessionScope.sessionId}</sql:param>
         </sql:query>
</c:catch>
<c:forEach items="${profile.rows}" var="rs">

<c:set var="oldProfileImg1" value="${rs.profile_img }" />
<c:set var="oldBackgroundImg1" value="${rs.background_img }" />
</c:forEach>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getSession().getAttribute("sessionId").toString()+"/";
	String dbProfileImg = pageContext.getAttribute("oldProfileImg1").toString();
	String dbBackgroundImg = pageContext.getAttribute("oldBackgroundImg1").toString();
 
    // 10Mbyte 제한
    int maxSize  = 1024*1024*100;       
 
    // 웹서버 컨테이너 경로
    String root = request.getSession().getServletContext().getRealPath("/");
    // 파일 저장 경로
    String savePath = root + "upload/"+id;
    File dir = new File(savePath);
	if(!dir.exists()){
		dir.mkdirs();
	}
    
    // 업로드 파일명
    String uploadFile1 = ""; //배경 이미지
    String uploadFile2 = ""; //프로필 이미지
    // 실제 저장할 파일명
    String newFileName1 = ""; //배경 이미지
    String newFileName2 = ""; //프로필 이미지
    int read = 0;
    byte[] buf = new byte[1024];
    FileInputStream fin = null;
    FileOutputStream fout = null;
    long currentTime = System.currentTimeMillis(); 
    SimpleDateFormat simDf = new SimpleDateFormat("yyyyMMddHHmmss"); 

    
    try{
 
        MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
        
        // 파일업로드
        uploadFile1 = multi.getFilesystemName("user_profile_background_img_search");
        uploadFile2 = multi.getFilesystemName("user_profile_img_search"); 
        if(uploadFile1==null){newFileName1 = dbBackgroundImg;}
        if(uploadFile2==null){newFileName2 = dbProfileImg;}
         if(uploadFile1!=null){
        // 실제 저장할 파일명(ex : 20181126151221.zip)
        newFileName1 = "b"+simDf.format(new Date(currentTime)) +"."+ uploadFile1.substring(uploadFile1.lastIndexOf(".")+1);
         
        // 업로드된 파일 객체 생성
        File oldFile1 = new File(savePath+ uploadFile1);
         
        // 실제 저장될 파일 객체 생성
        File newFile1 = new File(savePath+ newFileName1);
 
        // 파일명 rename
        if(!oldFile1.renameTo(newFile1)){
 
            // rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
            buf = new byte[1024];
            fin = new FileInputStream(oldFile1);
            fout = new FileOutputStream(newFile1);
            read = 0;
            while((read=fin.read(buf,0,buf.length))!=-1){
                fout.write(buf, 0, read);
            }
            fin.close();
            fout.close();
            oldFile1.delete();

        	}
        }
        if(uploadFile2!=null){
            // 실제 저장할 파일명(ex : 20181126151221.zip)
            newFileName2 = "f"+simDf.format(new Date(currentTime)) +"."+ uploadFile2.substring(uploadFile2.lastIndexOf(".")+1);
             
            // 업로드된 파일 객체 생성
            File oldFile2 = new File(savePath + uploadFile2);
            // 실제 저장될 파일 객체 생성
            File newFile2 = new File(savePath + newFileName2);
     
            // 파일명 rename
            if(!oldFile2.renameTo(newFile2)){
     
                // rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
                buf = new byte[1024];
                fin = new FileInputStream(oldFile2);
                fout = new FileOutputStream(newFile2);
                read = 0;
                while((read=fin.read(buf,0,buf.length))!=-1){
                    fout.write(buf, 0, read);
                }

                fin.close();
                fout.close();
                oldFile2.delete();
            }  
           } 
        
        
        
    }catch(Exception e){
        System.out.println("이미지 업로드 오류 : "+e);
    }
 
%>

<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver" 
					url="jdbc:oracle:thin:@52.79.235.41:1521:xe" 
					user="ource" 
					password="ourvoice"
					var="conn"/>
<c:catch var="error">
	<sql:update dataSource = "${conn}" var = "insertimg">
         UPDATE user_profile_img set profile_img = ?, background_img = ? where user_id = ?
         <sql:param><%=newFileName2 %></sql:param>
         <sql:param><%=newFileName1 %></sql:param>
         <sql:param>${sessionScope.sessionId}</sql:param>
</sql:update>
</c:catch>
<script>location.href="mypage_main.jsp?id=${sessionScope.sessionId}";</script>