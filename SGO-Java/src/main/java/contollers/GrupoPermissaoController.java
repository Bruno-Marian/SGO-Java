package contollers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import models.GrupoPermissao;
import utils.Conexao;

public class GrupoPermissaoController {
	private static Connection con = Conexao.getConexao();

	public static boolean salvar(GrupoPermissao gp) {
		try {
			PreparedStatement stm;
			
			if (registroExistente(gp.getGrupo_usuario(), gp.getPermisssao_usuario()) == true) {
				return true;
			}
			
			if (gp.getId() == 0) {
				stm = con.prepareStatement("INSERT INTO GRUPO_PERMISSAO(PERMISSAO_USUARIO, GRUPO_USUARIO) VALUES(?,?)");
				stm.setInt(1, gp.getPermisssao_usuario());
				stm.setInt(2, gp.getGrupo_usuario());
			} else {
				stm = con.prepareStatement(
						"UPDATE GRUPO_PERMISSAO SET PERMISSAO_USUARIO = ?, GRUPO_USUARIO = ? WHERE ID = ?");
				stm.setInt(1, gp.getPermisssao_usuario());
				stm.setInt(2, gp.getGrupo_usuario());
				stm.setInt(3, gp.getId());
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
			PreparedStatement stm = con.prepareStatement("SELECT * FROM GRUPO_PERMISSAO ORDER BY ID DESC");
			rs = stm.executeQuery();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return rs;
	}
	
	public static ResultSet consultarExibir() {
		ResultSet rs = null;
		try {
			PreparedStatement stm = con.prepareStatement("SELECT GP.ID, PU.PERMISSAO, GU.ACAO FROM GRUPO_PERMISSAO GP\r\n"
					+ "JOIN PERMISSAO_USUARIO PU ON PU.ID = GP.PERMISSAO_USUARIO\r\n"
					+ "JOIN GRUPO_USUARIO GU ON GU.ID = GP.GRUPO_USUARIO "
					+ "ORDER BY GU.ID, GP.ID DESC;");
			rs = stm.executeQuery();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return rs;
	}

	public static GrupoPermissao consultar(int id) {
		GrupoPermissao gp = null;
		try {
			PreparedStatement stm = con.prepareStatement("SELECT * FROM GRUPO_PERMISSAO WHERE ID = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				gp = new GrupoPermissao(rs.getInt("ID"), rs.getInt("PERMISSAO_USUARIO"), rs.getInt("GRUPO_USUARIO"));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return gp;
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
	
	public static boolean registroExistente(int grupo, int permissao) 
	{
		try {
			PreparedStatement stm = con.prepareStatement("SELECT * FROM GRUPO_PERMISSAO WHERE GRUPO_USUARIO = ? AND PERMISSAO_USUARIO = ?");
			stm.setInt(1, grupo);
			stm.setInt(2, permissao);
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				return true;
			}
		}catch (Exception e) {
			System.err.println(e.getMessage());
			return false;
		}
		return false;
	}
}
