<%@page import="contollers.GrupoUsuarioController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consultar Grupo de Usuários</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
	   rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
	   crossorigin="anonymous">
</head>
<body>
 <header class="mt-4">
        <h1 class="text-center">Consultar Grupo de Usuários</h1>
   </header>
   <nav></nav>
   <main class="p-4">
       <table class="table table-striped">
         <thead>
             <tr>
                 <th>Id</th>
                 <th>Ação</th>
                 <th>Observação</th>
             </tr>
         </thead>
         <tbody>
           <%
              ResultSet grupoUsuarios = GrupoUsuarioController.consultar();
              while(grupoUsuarios.next()){
            	  out.print("<tr>");
            	  out.print("<td>"+ grupoUsuarios.getString("id") +"</td>");
            	  out.print("<td>"+ grupoUsuarios.getString("acao") +"</td>");
            	  out.print("<td>"+ grupoUsuarios.getString("observacao") +"</td>");
            	  String editar = "<td><a href='EditarGrupoUsuario.jsp?id="+ grupoUsuarios.getString("id") +"'>Editar</a>";
            	  String excluir = "<td><a href='ExcluirGrupoUsuario.jsp?id="+ grupoUsuarios.getString("id") +"'>Excluir</a>";
            	  out.print(editar + " " + excluir);
            	  out.print("<tr>");
              }
           %>
         </tbody>
       </table>
   </main>
</body>
</html>