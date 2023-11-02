package models;

import java.sql.Date;

public class Funcionario {
	private int id;
	private String nome;
	private String sexo;
	private Date dataNascimento;
	private int funcao;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public int getFuncao() {
		return funcao;
	}

	public void setFuncao(int funcao) {
		this.funcao = funcao;
	}

	public Funcionario(int id, String nome, String sexo, Date dataNascimento, int funcao) {
		super();
		this.id = id;
		this.nome = nome;
		this.sexo = sexo;
		this.dataNascimento = dataNascimento;
		this.funcao = funcao;
	}

}
