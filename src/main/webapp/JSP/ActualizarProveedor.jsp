<%@page import="DAO.ProveedorDAO" %>
<%@page import="Modelo.Proveedor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <body>
        <%
            ProveedorDAO pdao = new ProveedorDAO();
            
            if(request.getParameter("actualizar_prov") != null)  {
                int id = Integer.parseInt(request.getParameter("id_actualizar"));
                
                Proveedor p =  pdao.buscarUno(id);
                if(p != null) {
                
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
                    out.print("<td>"+p.getNombre()+"</td>");
                    out.print("<td>"+p.getTelefono()+"</td>");
                    out.print("<td>"+p.getGrupo()+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                    out.print("<br><br><br><br>");
                    
                    out.print("<form action='CRUDProveedores.jsp' method='post' name='actualiza'>");
                    
                    out.print("ID: <input type='text' name='idecin' value='"+id+"' readonly><br><br>");
                    out.print("Nombre: <input type='text' name='nombrecin' value='"+p.getNombre()+"'><br><br>");
                    out.print("Telefono: <input type='text' name='telefonito' value='"+p.getTelefono()+"'><br><br>");
                    out.print("Grupo: <input type='text' name='grupito' value='"+p.getGrupo()+"'><br><br>");
                    
                    out.print("<input type='submit' value='Actualizar' name='valida'>");
                    out.print("</form>");
                
                }
                
            }
        %>
        <a href="../HTMLs/Proveedores.html">Regresar</a>
    </body>
</html>
