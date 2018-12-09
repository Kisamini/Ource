package SQLSource;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SQLtoRegister {

	public static int selectFrom_Users_Register (String userID){
		CallableStatement stmt = null;
		ResultSet rs = null;
		checkConnection();
		
		try{
			System.out.println(userID +" checking");
			stmt = ConnDatabase.conn.prepareCall("CALL user_login(?, ?)");
			stmt.setString(1, userID);
			stmt.registerOutParameter(2,  oracle.jdbc.OracleTypes.CURSOR);
			stmt.executeQuery();
			rs = (ResultSet) stmt.getObject(2);
			System.out.println("SELECTOR : QueryExecuted");
			
			if(!rs.next()){
				System.out.println("SELECTOR : Id not found from table : 1");
				return 1;
			}
		}
		catch(SQLException e){
			System.out.println("SELECTOR : QueryUnexecuted");
			return 0;
		}
		finally{
			closeStmt(stmt);
		}
		System.out.println("SELECTOR : Id found from table : 0");
		return 0;
	}//selectFrom_Users_Register
	
	
	
	
	
	
	
	
	
	public static int insertInto_Users_Register (UserDTO user){
		CallableStatement stmt = null;
		checkConnection();
		

		try{
			if(selectFrom_Users_Register(user.getId()) == 0){
				System.out.println("REGISTER : ID IS ALREADY USING");
				return 0; //ID가 이미 존재함.
			}
			stmt = ConnDatabase.conn.prepareCall("CALL t_users_insert(?,?,?,?,?,?,?)");
//			if(user.getGender().equals("남자")){
//				user.setGender("M");
//			}
//			else{
//				user.setGender("F");
//			}
			
			System.out.println(user.getId()+" "+user.getPw()+" "+user.getName()+" "+user.getGender()+" "+user.getBirth()+" "+user.getQuest()+" "+user.getAnswer());

			
			stmt.setString(1, user.getId());
			stmt.setString(2, user.getPw());
			stmt.setString(3, user.getName());
			stmt.setString(4, user.getGender());
			stmt.setString(5, user.getBirth());
			stmt.setString(6, user.getQuest());
			stmt.setString(7, user.getAnswer());
			stmt.executeUpdate();
			System.out.println("REGISTER : Query Execueted");
		}//try
		catch(SQLException e){
			System.out.println("REGISTER : Query Unexecueted");
			return 0;
		}//catch
		finally{
			closeStmt(stmt);
		}//finally
		return 1;
	}//insertInto_Users_Register
	
	
	private static void checkConnection(){
		if(ConnDatabase.conn == null){
			ConnDatabase.doConn();
			System.out.println("REGISTER : we got the connection");
		}//if
	}//checkConnection
	
	private static void closeStmt(Statement st){
		try {
			if(st != null){
				st.close();
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}//closeStmt

}//SQLtoRegistser
