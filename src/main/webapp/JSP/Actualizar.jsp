<%@page import="DAO.UsuarioDAO" %>
<%@page import="Modelo.Usuario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <body>
        <%
            UsuarioDAO udao = new UsuarioDAO();
            
            if(request.getParameter("actualizar") != null)  {
                int id = Integer.parseInt(request.getParameter("id_actualizar"));
                
                Usuario u =  udao.buscarUno(id);
                if(u != null) {
                
                    out.print("<h2>Usuario</h2>");
                    out.print("<table>");
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("<th>Apellido</th>");
                    out.print("<th>Contraseña</th>");
                    out.print("<th>Rol</th>");
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    
                    out.print("<td>"+id+"</td>");
                    out.print("<td>"+u.getNombre()+"</td>");
                    out.print("<td>"+u.getApellido()+"</td>");
                    out.print("<td>"+u.getContraseña()+"</td>");
                    out.print("<td>"+u.getNombreRol()+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                    out.print("<br><br><br><br>");
                    
                    out.print("<form action='CRUDUsuarios2.jsp' method='post' name='actualiza'>");
                    
                    out.print("ID: <input type='text' name='idecin' value='"+id+"' readonly><br><br>");
                    out.print("Nombre: <input type='text' name='nombrecin' value='"+u.getNombre()+"'><br><br>");
                    out.print("Apellido: <input type='text' name='apellidocin' value='"+u.getApellido()+"'><br><br>");
                    out.print("Contraseña: <input type='text' name='contrasenia' value='"+u.getContraseña()+"'><br><br>");
                    
                    out.print("Rol:<br><br>");
                    if(u.getNombreRol().equals("Vendedor")) {
                        out.print("<select name='rolecin'>");
                        out.print("<option value='Seleccione alguna'>Seleccione alguna</option>");
                        out.print("<option selected value='Vendedor'>Vendedor</option>");
                        out.print("<option value='Encargado_almacen'>Encargado de almacen</option>");
                        out.print("<option value='Gerente'>Gerente</option>");
                        out.print("<option value='Administrador'>Administrador</option>");
                    }
                    
                    if(u.getNombreRol().equals("Encargado de almacen")) {
                        out.print("<select name='rolecin'>");
                        out.print("<option value='Seleccione alguna'>Seleccione alguna</option>");
                        out.print("<option value='Vendedor'>Vendedor</option>");
                        out.print("<option selected value='Encargado_almacen'>Encargado de almacen</option>");
                        out.print("<option value='Gerente'>Gerente</option>");
                        out.print("<option value='Administrador'>Administrador</option>");
                    }
                    
                    if(u.getNombreRol().equals("Gerente")) {
                        out.print("<select name='rolecin'>");
                        out.print("<option value='Seleccione alguna'>Seleccione alguna</option>");
                        out.print("<option value='Vendedor'>Vendedor</option>");
                        out.print("<option value='Encargado_almacen'>Encargado de almacen</option>");
                        out.print("<option selected value='Gerente'>Gerente</option>");
                        out.print("<option value='Administrador'>Administrador</option>");
                    }
                    
                    if(u.getNombreRol().equals("Administrador")) {
                        out.print("<select name='rolecin'>");
                        out.print("<option value='Seleccione alguna'>Seleccione alguna</option>");
                        out.print("<option value='Vendedor'>Vendedor</option>");
                        out.print("<option value='Encargado_almacen'>Encargado de almacen</option>");
                        out.print("<option value='Gerente'>Gerente</option>");
                        out.print("<option selected value='Administrador'>Administrador</option>");
                    }
                    out.print("</select>");
                    out.print("<br><br>");
                    
                    out.print("<input type='submit' value='Actualizar' name='valida'>");
                    out.print("</form>");
                
                }
                
            }
        %>
        <a href="../HTMLs/Usuarios.html">Regresar</a>
    </body>
</html>
