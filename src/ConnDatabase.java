import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnDatabase {
	
	public static Connection conn;
	
	
	public static void doConn(){
		try{
			String user = "ource";
			String pw = "ourvoice";
			String url = "jdbc:oracle:thin:@52.79.235.41:1521:xe";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
		}
		catch (ClassNotFoundException e){
			System.out.println("����̹� �ε� ����");
		}
		catch (SQLException e){
			System.out.println("����Ÿ���̽� ���� ����");
		}
		catch (Exception e){
			System.out.println("�˼����� ����");
		}//catch
		
		System.out.println("�����ͺ��̽� ���� ����");
	}//doConn

}//class
