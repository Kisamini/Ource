package RegisterSource;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SQLSource.SQLtoRegister;

public class UserSelectServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String userID = request.getParameter("userID");
		char [] idChecker = userID.toCharArray();
		System.out.println();
		idCheck(idChecker, response, userID);
	
		
	}//doPost
	
	private void idCheck(char [] idToCharArray, HttpServletResponse response, String userID) throws IOException{
		
		
		System.out.println("SELECT SERVLET : ID CHECK START");

		if(!userID.matches("^[a-z0-9]*$")){
			System.out.println("���̵� �ѱ�, ���� �빮�� Ȥ�� Ư������ ���� �߰�");
			response.getWriter().write(-2+""); //���̵� �ҷ�
			return;
		}
		
		if(userID.equals("") || userID == null){
			System.out.println("���̵� ���Է� �߰�");
			response.getWriter().write(-1+""); //���̵� ���Է�
			return;
		}//if
		else{
			response.getWriter().write(SQLtoRegister.selectFrom_Users_Register(userID) + ""); //���
			return;
		}//else
	}
}//class
