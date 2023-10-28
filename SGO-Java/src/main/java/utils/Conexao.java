package utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

	public static void conectar() {
		try {
			Class.forName("com.mysql.cj.jbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgojava", "root", "root");
			System.out.println("Conectado");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static Connection getConexao() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgojava", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}