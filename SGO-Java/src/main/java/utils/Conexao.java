package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	
	public static void conectar() {
		try {
			Class.forName("com.mysql.cj.jbc.Driver");
			Connection con=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/sgo", "root", "root");
			System.out.println("Conectado");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
}