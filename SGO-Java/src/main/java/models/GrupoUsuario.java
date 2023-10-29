package models;

public class GrupoUsuario {
	private int id;
	private String acao;
	private String observacao;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAcao() {
		return acao;
	}

	public void setAcao(String acao) {
		this.acao = acao;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public GrupoUsuario(int id, String acao, String observacao) {
		super();
		this.id = id;
		this.acao = acao;
		this.observacao = observacao;
	}
}
