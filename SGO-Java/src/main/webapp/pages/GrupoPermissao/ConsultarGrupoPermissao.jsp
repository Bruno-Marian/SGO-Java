<%@page import="contollers.GrupoPermissaoController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consultar Grupo de Permissão</title>
<link rel="stylesheet" type="text/css" href="../../styles/Style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
	   rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
	   crossorigin="anonymous">
</head>
<body>
 <header class="mt-4">
        <h1 class="text-center">Consultar Grupo de Permissão</h1>
   </header>
   <nav></nav>
   <main class="p-4">
       <table class="table table-striped">
         <thead>
             <tr>
                 <th>Id</th>
                 <th>Permissão</th>
                 <th>Grupo Usuário</th>
             </tr>
         </thead>
         <tbody>
           <%
              ResultSet grupoPermissao = GrupoPermissaoController.consultarExibir();
              while(grupoPermissao.next()){
            	  out.print("<tr>");
            	  out.print("<td>"+ grupoPermissao.getString("id") +"</td>");
            	  out.print("<td>"+ grupoPermissao.getString("permissao") +"</td>");
            	  out.print("<td>"+ grupoPermissao.getString("acao") +"</td>");
            	  String editar = "<td><a href='EditarGrupoPermissao.jsp?id="+ grupoPermissao.getString("id") +"'>Editar</a>";
            	  String excluir = "<td><a href='ExcluirGrupoPermissao.jsp?id="+ grupoPermissao.getString("id") +"'>Excluir</a>";
            	  out.print(editar + " " + excluir);
            	  out.print("<tr>");
              }
           %>
         </tbody>
       </table>
   </main>
</body>
</html>