<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		InitialContext ctx = new InitialContext();
		//The JDBC Data source that we just created
		DataSource ds = (DataSource) ctx.lookup("jdbc/Teste");
		Connection connection = ds.getConnection();

		if (connection == null) {
			throw new SQLException("Error establishing connection!");
		}
		String query = "SELECT * FROM pessoa";

		PreparedStatement statement = connection.prepareStatement(query);
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			out.print(rs.getInt("id") + "<br>");
			out.print(rs.getString("nome") + "<br>");
			out.print(rs.getString("telefone") + "<br>");
		}
	%>

</body>
</html>