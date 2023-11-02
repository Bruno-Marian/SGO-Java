package contollers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import models.Funcionario;
import utils.Conexao;

public class FuncionarioController {
	private static Connection con = Conexao.getConexao();

	public static boolean salvar(Funcionario fu) {
		try {
			PreparedStatement stm;

			if (fu.getId() == 0) {
				stm = con.prepareStatement("INSERT INTO FUNCIONARIO(NOME, SEXO, DATA_NASCIMENTO, FUNCAO) VALUES(?, ?, ?, ?)");
				stm.setString(1, fu.getNome());
				stm.setString(2, fu.getSexo());
				stm.setDate(3, fu.getDataNascimento());
				stm.setInt(4, fu.getFuncao());
			} else {
				stm = con.prepareStatement("UPDATE FUNCIONARIO SET NOME = ?, SEXO = ?, DATA_NASCIMENTO = ?, FUNCAO = ?  WHERE ID = ?");
				stm.setString(1, fu.getNome());
				stm.setString(2, fu.getSexo());
				stm.setDate(3, fu.getDataNascimento());
				stm.setInt(4, fu.getFuncao());
				stm.setInt(5, fu.getId());
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
			PreparedStatement stm = con.prepareStatement("SELECT * FROM FUNCIONARIO ORDER BY ID DESC");
			rs = stm.executeQuery();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return rs;
	}
	
	public static ResultSet consultarExibir() {
		ResultSet rs = null;
		try {
			PreparedStatement stm = con.prepareStatement("SELECT FU.ID, FU.NOME, \r\n"
					+ "CASE WHEN FU.SEXO = \"M\" THEN \"MASCULINO\"\r\n"
					+ "WHEN FU.SEXO = \"F\" THEN \"FEMININO\"\r\n"
					+ "ELSE \"OUTRO\" END AS SEXO,\r\n"
					+ "DATE_FORMAT(FU.DATA_NASCIMENTO, \"%d/%m/%Y\") AS DATA_NASCIMENTO,\r\n"
					+ "F.NOME AS FUNCAO\r\n"
					+ " FROM FUNCIONARIO FU\r\n"
					+ "JOIN FUNCAO F ON F.ID = FU.FUNCAO");
			rs = stm.executeQuery();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return rs;
	}

	public static Funcionario consultar(int id) {
		Funcionario fu = null;
		try {
			PreparedStatement stm = con.prepareStatement("SELECT * FROM FUNCIONARIO WHERE ID = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				fu = new Funcionario(rs.getInt("ID"), rs.getString("NOME"), rs.getString("SEXO"), rs.getDate("DATA_NASCIMENTO"), rs.getInt("FUNCAO"));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return fu;
	}

	public static boolean excluir(int id) {
		try {
			PreparedStatement stm = con.prepareStatement("DELETE FROM FUNCIONARIO WHERE ID = ?");
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return false;
		}
		return true;
	}
}
