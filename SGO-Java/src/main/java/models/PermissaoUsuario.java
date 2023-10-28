package models;

public class PermissaoUsuario {
	private int id;
	private String permissao;
	private String tabela;
	private boolean vizualizar = false;
	private boolean editar = false;
	private boolean deletar = false;
	private boolean incluir = false;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPermissao() {
		return permissao;
	}

	public void setPermissao(String permissao) {
		this.permissao = permissao;
	}

	public String getTabela() {
		return tabela;
	}

	public void setTabela(String tabela) {
		this.tabela = tabela;
	}

	public boolean isVizualizar() {
		return vizualizar;
	}

	public void setVizualizar(boolean vizualizar) {
		this.vizualizar = vizualizar;
	}

	public boolean isEditar() {
		return editar;
	}

	public void setEditar(boolean editar) {
		this.editar = editar;
	}

	public boolean isDeletar() {
		return deletar;
	}

	public void setDeletar(boolean deletar) {
		this.deletar = deletar;
	}

	public boolean isIncluir() {
		return incluir;
	}

	public void setIncluir(boolean incluir) {
		this.incluir = incluir;
	}

	public PermissaoUsuario(int id, String permissao, String tabela, boolean vizualizar, boolean editar,
			boolean deletar, boolean incluir) {
		super();
		this.id = id;
		this.permissao = permissao;
		this.tabela = tabela;
		this.vizualizar = vizualizar;
		this.editar = editar;
		this.deletar = deletar;
		this.incluir = incluir;
	}
}
