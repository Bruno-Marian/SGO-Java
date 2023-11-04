
<%@page import="contollers.UsuarioController"%>
<%
UsuarioController.logout();
response.sendRedirect("../Login/Login.jsp");
%>