<%@page import="br.com.erick.agenda.bd.ContatoDao"%>
<%@page import="br.com.erick.agenda.modelo.Contato"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Long id = Long.parseLong(request.getParameter("id"));
		Contato contato = new Contato();
		contato.setId(id);
		ContatoDao dao = new ContatoDao();
		dao.remove(contato);
	%>
	<p>Contato Removido</p>
</body>
</html>