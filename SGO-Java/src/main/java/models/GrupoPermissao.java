package models;

public class GrupoPermissao {
	private int id;
	private int permisssao_usuario;
	private int grupo_usuario;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPermisssao_usuario() {
		return permisssao_usuario;
	}

	public void setPermisssao_usuario(int permisssao_usuario) {
		this.permisssao_usuario = permisssao_usuario;
	}

	public int getGrupo_usuario() {
		return grupo_usuario;
	}

	public void setGrupo_usuario(int grupo_usuario) {
		this.grupo_usuario = grupo_usuario;
	}

	public GrupoPermissao(int id, int permisssao_usuario, int grupo_usuario) {
		super();
		this.id = id;
		this.permisssao_usuario = permisssao_usuario;
		this.grupo_usuario = grupo_usuario;
	}
}
