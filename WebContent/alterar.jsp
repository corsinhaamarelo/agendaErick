<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.erick.agenda.modelo.Contato"%>
<%@page import="br.com.erick.agenda.bd.ContatoDao"%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		SimpleDateFormat dataNascimento = new SimpleDateFormat("dd/MM/yyyy");
		ContatoDao dao = new ContatoDao();
		Contato contato = dao.getContatoById(request.getParameter("id"));
	%>
	<form action="alteraContato">
		Id: <input type="text" name="id" value="<%=contato.getId()%>" /><br />
		Nome: <input type="text" name="nome" value="<%=contato.getNome()%>" /><br />
		E-mail: <input type="text" name="email"
			value="<%=contato.getEmail()%>" /><br /> Endereço: <input
			type="text" name="endereco" value="<%=contato.getEndereco()%>" /><br />
		Data Nascimento: <input type="text" name="dataNascimento"
			value="<%=dataNascimento.format(contato.getDataNascimento().getTime())%>" /><br /> <input
			type="submit" value="Gravar" />
	</form>
</body>
</html>