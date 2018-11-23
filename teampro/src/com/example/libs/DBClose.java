package com.example.libs;

import java.sql.Connection;

public class DBClose {
	public static void close(Connection conn) {
		try {
			if(conn != null) conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
