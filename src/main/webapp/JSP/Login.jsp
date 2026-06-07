<%@page import="Modelo.Usuario" %>
<%@page import="DAO.UsuarioDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validando inicio de sesion</title>
    </head>
    <body>
        <%
            UsuarioDAO udao = new UsuarioDAO();
            
            String nombre = request.getParameter("user");
            String contraseña = request.getParameter("password");
            Usuario u = udao.login(nombre, contraseña);
            
            if(u != null) {
                session.setAttribute("usuario", u);
                response.sendRedirect("../HTMLs/IHome.html");
            } else {
                out.print("<script>alert('Usuario y contraseña incorrectos');"
                        + "history.back();</script>");
            }
        %>
    </body>
</html>
