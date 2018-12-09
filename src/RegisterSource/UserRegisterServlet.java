package RegisterSource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SQLSource.SQLtoRegister;
import SQLSource.UserDTO;

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
							request.getParameter("userAge"),
							request.getParameter("userQuest"),
							request.getParameter("userAnswer"));
		
		response.getWriter().write(userDataCheckAndSetter(response, user)+"");
	
	}//doPost

	
	private int userDataCheckAndSetter(HttpServletResponse response, UserDTO user) throws IOException{
		
		char [] birthToArray = user.getBirth().toCharArray();
		if(!user.isPasswordMatched()){
			System.out.println("ºñ¹Ð¹øÈ£ ºñ ÀÏÄ¡");
			return -1;
		}//if
		
		if(!user.isUserInfoSubmitCompletly()){
			System.out.println("Á¤º¸ ¹ÌÀÔ·Â ¹ß°ß");
			return -2;
		}//Á¤º¸ ¹ÌÀÔ·Â Á¸Àç
		
		if(user.getPw().toCharArray().length < 8){
			System.out.println("ºñ¹Ð¹øÈ£°¡ 8ÀÚ¸® ¹Ì¸¸");
			return -3;
		}
		
		if(!checkNames(user.getName())){
			System.out.println("ÇÑ±Û ÀÚÀ½ È¤Àº ¸ðÀ½ Æ÷ÇÔ");
			return -4;
		}
		
		if(birthToArray.length < 8 || !user.getBirth().matches("^[0-9]*$") || !checkBirths(user.getBirth())){
			System.out.println("»ý³â¿ùÀÏ ÀÔ·Â ¿À·ù");
			return -5;
		}
	
		if(SQLtoRegister.insertInto_Users_Register(user)== 1){
			System.out.println("°¡ÀÔ ¿Ï·á");
			return 1;
		}
		else{
			System.out.println("°¡ÀÔ ½ÇÆÐ");
			return 0;
		}
		
	}//userDataCheckAndSetter
	
	private boolean checkBirths(String birth){
		System.out.println(birth.substring(0,4));
		System.out.println(birth.substring(4,6));
		System.out.println(birth.substring(6,8));
		if( Integer.parseInt(birth.substring(0,4)) < 1950 || (Integer.parseInt(birth.substring(0,4)) > Calendar.getInstance().get(Calendar.YEAR)) ){
			System.out.println(Calendar.getInstance().get(Calendar.YEAR));
			System.out.println(birth.substring(0,4));
			System.out.println("YEAR INCORRECT");
			return false; //YEAR INCORRECT
		}
		if( Integer.parseInt(birth.substring(4,6)) == 0 || Integer.parseInt(birth.substring(4,6)) > 12){
			System.out.println(birth.substring(4,6));
			System.out.println("MONTH INCORRECT");
			return false; //MONTH INCORRECT
		}
		if( Integer.parseInt(birth.substring(6,8)) == 0 || Integer.parseInt(birth.substring(6,8)) > 31){
			System.out.println(birth.substring(6,8));
			System.out.println("DAY INCORRECT");
			return false; //DAY INCORRECT
		}
		System.out.println(birth);
		return true;
	}
	
	private boolean checkNames(String name){
		if(!name.matches("^[¤¡-ÆRa-z0-9]*$")){
			System.out.println(name);
			return false;
		}//if
		else{
			return true;
		}
	}
}//class
