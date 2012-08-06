package br.com.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import br.com.ConnectionFactory.ConnectionFactory;
import br.com.Model.Pessoa;

public class PessoaDAO {
	public Connection con;

	public PessoaDAO() {
		con = new ConnectionFactory().getConnection();
	}

	public List<Pessoa> getLista() {

		List<Pessoa> lista = new ArrayList<Pessoa>();

		String query = "SELECT * FROM pessoa";

		try {
			PreparedStatement statement = con.prepareStatement(query);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {
				Pessoa pessoa = new Pessoa();
				pessoa.setId(rs.getInt("id"));
				pessoa.setNome(rs.getString("nome"));
				pessoa.setTelefone(rs.getString("telefone"));
				lista.add(pessoa);
			}
		} catch (SQLException e) {

			new RuntimeException();
		}
		return lista;
	}

	public Pessoa getPessoa(int id) {

		Pessoa pessoa = new Pessoa();

		String query = "SELECT * FROM pessoa where id = ?";

		try {
			PreparedStatement statement = con.prepareStatement(query);
			statement.setInt(1, id);
			ResultSet rs = statement.executeQuery();

			while (rs.next()) {

				pessoa.setId(rs.getInt("id"));
				pessoa.setNome(rs.getString("nome"));
				pessoa.setTelefone(rs.getString("telefone"));

			}
		} catch (SQLException e) {

			new RuntimeException();
		}
		return pessoa;
	}
}
