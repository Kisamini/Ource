import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserRegisterServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html:charset=UTF-8");
		
		UserDTO user = new UserDTO(request.getParameter("userID"), 
							request.getParameter("userPW1"), 
							request.getParameter("userPW2"),
							request.getParameter("userName"), 
							request.getParameter("userGender"),
							request.getParameter("userAge"));
		
		response.getWriter().write(userDataCheckAndSetter(response, user)+"");
	
	}//doPost

	
	private int userDataCheckAndSetter(HttpServletResponse response, UserDTO user) throws IOException{
		
		char [] birthToArray = user.getBirth().toCharArray();
		if(!user.isPasswordMatched()){
			System.out.println("비밀번호 비 일치");
			return -1;
		}//if
		
		if(!user.isUserInfoSubmitCompletly()){
			System.out.println("정보 미입력 발견");
			return -2;
		}//정보 미입력 존재
		
		if(user.getPw().toCharArray().length < 8){
			System.out.println("비밀번호가 8자리 미만");
			return -3;
		}
		
		if(!checkNames(user.getName())){
			System.out.println("한글 자음 혹은 모음 포함");
			return -4;
		}
		
		if(birthToArray.length < 8 || !user.getBirth().matches("^[0-9]*$")){
			System.out.println("생년월일 입력 오류");
			return -5;
		}
	
		if(SQLtoRegister.insertInto_Users_Register(user)== 1){
			System.out.println("가입 완료");
			return 1;
		}
		else{
			System.out.println("가입 실패");
			return 0;
		}
		
	}//userDataCheckAndSetter
	
	
	
	private boolean checkNames(String name){
		if(!name.matches("^[ㄱ-힣a-zA-Z0-9]*$")){
			System.out.println(name);
			return false;
		}//if
		else{
			return true;
		}
	}
}//class
