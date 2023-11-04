package models;

public class Usuario {
	private int id;
	private String login;
	private String senha;
	private int grupo_usuario;
	private int funcionario;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public int getGrupo_usuario() {
		return grupo_usuario;
	}
	public void setGrupo_usuario(int grupo_usuario) {
		this.grupo_usuario = grupo_usuario;
	}
	public int getFuncionario() {
		return funcionario;
	}
	public void setFuncionario(int funcionario) {
		this.funcionario = funcionario;
	}
	
	public Usuario() {
		
	}
	
	public Usuario(int id, String login, String senha, int grupo_usuario, int funcionario) {
		super();
		this.id = id;
		this.login = login;
		this.senha = senha;
		this.grupo_usuario = grupo_usuario;
		this.funcionario = funcionario;
	}
	
}
