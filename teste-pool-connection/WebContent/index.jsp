<%@page import="br.com.Model.Pessoa"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="br.com.Dao.PessoaDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teste Pool Conexão</title>
</head>
<body>

	<%
		List<Pessoa> lista = new PessoaDAO().getLista();
	%>
	<table border="1" style="text-align: center; width: 50%;">
		<thead>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Telefone</th>
			</tr>
		</thead>

		<%
			for (Pessoa item : lista) {
%>
		<tr>
			<td><%=item.getId()%></td>
			<td><%=item.getNome()%></td>
			<td><%=item.getTelefone()%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>