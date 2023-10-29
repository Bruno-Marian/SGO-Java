package contollers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import models.GrupoUsuario;
import utils.Conexao;

public class GrupoUsuarioController {
	private static Connection con = Conexao.getConexao();

	public static boolean salvar(GrupoUsuario gu) {
		try {
			PreparedStatement stm;

			if (gu.getId() == 0) {
				stm = con.prepareStatement("INSERT INTO GRUPO_USUARIO(ACAO, OBSERVACAO) VALUES(?,?)");
				stm.setString(1, gu.getAcao());
				stm.setString(2, gu.getObservacao());
			} else {
				stm = con.prepareStatement("UPDATE GRUPO_USUARIO SET ACAO = ?, OBSERVACAO = ? WHERE ID = ?");
				stm.setString(1, gu.getAcao());
				stm.setString(2, gu.getObservacao());
				stm.setInt(3, gu.getId());
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
			PreparedStatement stm = con.prepareStatement("SELECT * FROM GRUPO_USUARIO ORDER BY ID DESC");
			rs = stm.executeQuery();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return rs;
	}

	public static GrupoUsuario consultar(int id) {
		GrupoUsuario gu = null;
		try {
			PreparedStatement stm = con.prepareStatement("SELECT * FROM GRUPO_USUARIO WHERE ID = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				gu = new GrupoUsuario(rs.getInt("ID"), rs.getString("ACAO"), rs.getString("OBSERVACAO"));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return gu;
	}

	public static boolean excluir(int id) {
		try {
			PreparedStatement stm = con.prepareStatement("DELETE FROM GRUPO_USUARIO WHERE ID = ?");
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return false;
		}
		return true;
	}
}
