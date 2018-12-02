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
			System.out.println("드라이버 로딩 실패");
		}
		catch (SQLException e){
			System.out.println("데이타베이스 접속 실패");
		}
		catch (Exception e){
			System.out.println("알수없는 에러");
		}//catch
		
		System.out.println("데이터베이스 접속 성공");
	}//doConn

}//class
