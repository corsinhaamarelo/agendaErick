<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.erick.agenda.modelo.Contato"%>
<%@page import="java.util.*"%>
<%@page import="br.com.erick.agenda.bd.ContatoDao"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<table border=1>
		<%
			SimpleDateFormat dataNascimento = new SimpleDateFormat("dd/MM/yyyy");
			ContatoDao dao = new ContatoDao();
			List<Contato> contatos = dao.getLista();
			for (Contato c : contatos ) {
		%>
		<tr>
			<td><%=c.getNome()%></td>
			<td><%=c.getEmail()%></td>
			<td><%=c.getEndereco()%></td>
			<td><%=dataNascimento.format(c.getDataNascimento().getTime()) %></td>
			<td><a href="remove.jsp?id=<%=c.getId()%>"> Remover </a></td>
			<td><a href="alterar.jsp?id=<%=c.getId()%>"> Alterar </a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>