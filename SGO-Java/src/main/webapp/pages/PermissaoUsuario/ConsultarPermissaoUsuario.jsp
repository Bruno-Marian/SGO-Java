<%@page import="contollers.PermissaoUsuarioController"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consultar Permissão de Usuários</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" 
	   rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
	   crossorigin="anonymous">
</head>
<body>
 <header class="mt-4">
        <h1 class="text-center">Consultar Permissão de Usuários</h1>
   </header>
   <nav></nav>
   <main class="p-4">
       <table class="table table-striped">
         <thead>
             <tr>
                 <th>Id</th>
                 <th>Permissão</th>
                 <th>Tabela</th>
                 <th>Visualizar</th>
                 <th>Editar</th>
                 <th>Deletar</th>
                 <th>Incluir</th>
             </tr>
         </thead>
         <tbody>
           <%
              ResultSet permissaoUsuarios = PermissaoUsuarioController.consultar();
              while(permissaoUsuarios.next()){
            	  out.print("<tr>");
            	  out.print("<td>"+ permissaoUsuarios.getString("id") +"</td>");
            	  out.print("<td>"+ permissaoUsuarios.getString("permissao") +"</td>");
            	  out.print("<td>"+ permissaoUsuarios.getString("tabela") +"</td>");
            	  if (permissaoUsuarios.getBoolean("visualizar") == true){
            		  out.print("<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled checked></div></td>");
            	  }else{
            		  out.print("<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled></div></td>");
            	  }
            	  if (permissaoUsuarios.getBoolean("editar") == true){
            		  out.print("<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled checked></div></td>");
            	  }else{
            		  out.print("<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled></div></td>");
            	  }
            	  if (permissaoUsuarios.getBoolean("deletar") == true){
            		  out.print("<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled checked></div></td>");
            	  }else{
            		  out.print("<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled></div></td>");
            	  }
            	  if (permissaoUsuarios.getBoolean("incluir") == true){
            		  out.print("<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled checked></div></td>");
            	  }else{
            		  out.print("<td><div class='form-check form-switch'><input class='form-check-input' type='checkbox' disabled></div></td>");
            	  }
            	  out.print("<tr>");
              }
           %>
         </tbody>
       </table>
   </main>
</body>
</html>