package contollers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import models.Funcao;
import utils.Conexao;

public class FuncaoController {
	private static Connection con = Conexao.getConexao();
	
	public static boolean salvar(Funcao f) {
		try {
			PreparedStatement stm;
			
			if (f.getId() == 0) {
				stm = con.prepareStatement("INSERT INTO FUNCAO(NOME) VALUES(?)");
				stm.setString(1, f.getNome());
			} else {
				stm = con.prepareStatement(
						"UPDATE FUNCAO SET NOME = ? WHERE ID = ?");
				stm.setString(1, f.getNome());
				stm.setInt(2, f.getId());
			}
			stm.execute();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return false;
		}

		return true;
	}

	public static ResultSet consultar() {
		ResultSet rs = null;
		try {
			PreparedStatement stm = con.prepareStatement("SELECT * FROM FUNCAO ORDER BY ID DESC");
			rs = stm.executeQuery();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return rs;
	}

	public static Funcao consultar(int id) {
		Funcao f = null;
		try {
			PreparedStatement stm = con.prepareStatement("SELECT * FROM FUNCAO WHERE ID = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				f = new Funcao(rs.getInt("ID"), rs.getString("NOME"));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return f;
	}

	public static boolean excluir(int id) {
		try {
			PreparedStatement stm = con.prepareStatement("DELETE FROM FUNCAO WHERE ID = ?");
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return false;
		}
		return true;
	}
}
