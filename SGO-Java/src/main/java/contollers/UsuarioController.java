package contollers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Usuario;
import utils.Conexao;

public class UsuarioController {
	private static Connection con = Conexao.getConexao();

	public static boolean salvar(Usuario gp) {
		try {
			PreparedStatement stm;
			
			/*if (registroExistente(gp.getLogin(),gp.getSenha()) == true) {
				return true;
				//	System.out.println("Passei aqui");
			}*/
			
			if (gp.getId() == 0) {
				stm = con.prepareStatement("INSERT INTO USUARIO(LOGIN, SENHA, GRUPO_USUARIO, FUNCIONARIO) VALUES(?,?,?,?)");
				stm.setString(1, gp.getLogin());
				stm.setString(2, gp.getSenha());
				stm.setInt(3, gp.getGrupo_usuario());
				stm.setInt(4, gp.getFuncionario());
			} else {
				stm = con.prepareStatement(
						"UPDATE USUARIO SET LOGIN = ?, SENHA = ?, GRUPO_USUARIO = ?, FUNCIONARIO = ? WHERE ID = ?");
				stm.setString(1, gp.getLogin());
				stm.setString(2, gp.getSenha());
				stm.setInt(3, gp.getGrupo_usuario());
				stm.setInt(4, gp.getFuncionario());
				stm.setInt(5, gp.getId());
			}
			stm.execute();
		} catch (Exception e) {
			System.err.println(e.getMessage());		
			return false;
		}

		return true;
	}
	
	public static boolean ExisteUsuarioSenha(String login, String senha) 
	{
		try {
			PreparedStatement stm = con.prepareStatement("SELECT * FROM USUARIO WHERE LOGIN = ? AND SENHA = ?");
			stm.setString(1, login);
			stm.setString(2, senha);
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
	
	public static ResultSet consultar() {
		ResultSet rs = null;
		try {
			PreparedStatement stm = con.prepareStatement("SELECT * FROM USUARIO ORDER BY ID DESC");
			rs = stm.executeQuery();
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return rs;
	}
	
	public static Usuario consultar(int id) {
		Usuario us = new Usuario();
		try {
			PreparedStatement stm = con.prepareStatement("SELECT * FROM USUARIO WHERE ID = ?");
			stm.setInt(1, id);
			ResultSet rs = stm.executeQuery();
			if (rs.next()) {
				us = new Usuario(rs.getInt("ID"), rs.getString("LOGIN"), rs.getString("SENHA"), rs.getInt("GRUPO_USUARIO"), rs.getInt("FUNCIONARIO"));
			}
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		return us;
	}
	
	public static boolean excluir(int id) {
		try {
			PreparedStatement stm = con.prepareStatement("DELETE FROM USUARIO WHERE ID = ?");
			stm.setInt(1, id);
			stm.execute();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			return false;
		}
		return true;
	}
}
