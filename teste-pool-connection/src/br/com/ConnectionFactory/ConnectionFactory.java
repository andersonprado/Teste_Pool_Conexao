package br.com.ConnectionFactory;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionFactory {

	// Metodo recebe de um pool de Conexões de um servidor Glassfish
	public Connection getConnection() {

		Connection connection = null;
		try {

			InitialContext ctx = new InitialContext();

			DataSource ds = (DataSource) ctx.lookup("jdbc/Teste"); // Nome do
																	// resource
																	// dentro do
																	// Glassfish

			connection = ds.getConnection(); // recebe a conexão

			if (connection == null) {
				throw new SQLException("Error establishing connection!");
			}

		} catch (NamingException e) {
			System.out.println("Error establishing connection!");

		} catch (SQLException ex) {
			throw new RuntimeException();
		} 
		return connection;
	}
}
