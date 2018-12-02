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
			System.out.println("��й�ȣ �� ��ġ");
			return -1;
		}//if
		
		if(!user.isUserInfoSubmitCompletly()){
			System.out.println("���� ���Է� �߰�");
			return -2;
		}//���� ���Է� ����
		
		if(user.getPw().toCharArray().length < 8){
			System.out.println("��й�ȣ�� 8�ڸ� �̸�");
			return -3;
		}
		
		if(!checkNames(user.getName())){
			System.out.println("�ѱ� ���� Ȥ�� ���� ����");
			return -4;
		}
		
		if(birthToArray.length < 8 || !user.getBirth().matches("^[0-9]*$")){
			System.out.println("������� �Է� ����");
			return -5;
		}
	
		if(SQLtoRegister.insertInto_Users_Register(user)== 1){
			System.out.println("���� �Ϸ�");
			return 1;
		}
		else{
			System.out.println("���� ����");
			return 0;
		}
		
	}//userDataCheckAndSetter
	
	
	
	private boolean checkNames(String name){
		if(!name.matches("^[��-�Ra-zA-Z0-9]*$")){
			System.out.println(name);
			return false;
		}//if
		else{
			return true;
		}
	}
}//class
