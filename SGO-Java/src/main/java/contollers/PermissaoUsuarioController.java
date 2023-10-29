package contollers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import models.PermissaoUsuario;
import utils.Conexao;

public class PermissaoUsuarioController {
	private static Connection con = Conexao.getConexao();

	public static boolean salvar(PermissaoUsuario pu) {
		try {
			PreparedStatement stm;

			if (pu.getId() == 0) {
				stm = con.prepareStatement(
						"INSERT INTO PERMISSAO_USUARIO(PERMISSAO, TABELA, VISUALIZAR, EDITAR, DELETAR, INCLUIR) VALUES(?,?,?,?,?,?)");
				stm.setString(1, pu.getPermissao());
				stm.setString(2, pu.getTabela());
				stm.setBoolean(3, pu.isVizualizar());
				stm.setBoolean(4, pu.isEditar());
				stm.setBoolean(5, pu.isDeletar());
				stm.setBoolean(6, pu.isIncluir());
			} else {
				stm = con.prepareStatement(
						"UPDATE PERMISSAO_USUARIO SET PERMISSAO = ?, TABELA = ?, VISUALIZAR = ?, EDITAR = ?, DELETAR = ?, INCLUIR = ? WHERE ID = ?");
				stm.setString(1, pu.getPermissao());
				stm.setString(2, pu.getTabela());
				stm.setBoolean(3, pu.isVizualizar());
				stm.setBoolean(4, pu.isEditar());
				stm.setBoolean(5, pu.isDeletar());
				stm.setBoolean(6, pu.isIncluir());
				stm.setInt(7, pu.getId());
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
			PreparedStatement stm = con.prepareStatement("SELECT * FROM PERMISSAO_USUARIO ORDER BY ID DESC");
			rs = stm.executeQuery();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return rs;
	}

	public static PermissaoUsuario consultar(int id) {
		PermissaoUsuario pu = null;
		try {
			PreparedStatement stm = con.prepareStatement("SELECT * FROM PERMISSAO_USUARIO WHERE ID = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				pu = new PermissaoUsuario(rs.getInt("ID"), rs.getString("PERMISSAO"), rs.getString("TABELA"),
						rs.getBoolean("VISUALIZAR"), rs.getBoolean("EDITAR"), rs.getBoolean("DELETAR"),
						rs.getBoolean("INCLUIR"));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return pu;
	}

	public static boolean excluir(int id) {
		try {
			PreparedStatement stm = con.prepareStatement("DELETE FROM PERMISSAO_USUARIO WHERE ID = ?");
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return false;
		}
		return true;
	}
}
