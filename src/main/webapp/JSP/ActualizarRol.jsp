<%@page import="DAO.RolDAO" %>
<%@page import="Modelo.Rol" %>
<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8">

    <title>Actualizar Proveedor</title>

    <link rel="stylesheet" href="../CSS/gen_logistica.css"/>
    <link rel="stylesheet" href="../CSS/tablas.css"/>
    <link rel="stylesheet" href="../CSS/formularios _Actualizar.css"/>
    <link rel="stylesheet" href="../CSS/footerr.css"/>
    <link rel="stylesheet" href="../CSS/header.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="../miHeader.js"></script>
    <script src="../miFooter.js"></script>
</head>
<crear-header></crear-header>        
    <body>
        <%
            RolDAO rdao = new RolDAO();
            
            if(request.getParameter("actualizar") != null)  {
                int id = Integer.parseInt(request.getParameter("id_actualizar"));
                
                Rol r =  rdao.buscarUno(id);
                if(r != null) {
                
                    out.print("<h2>Actualizar Rol</h2>");
                    out.print("<table>");
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    
                    out.print("<td>"+id+"</td>");
                    out.print("<td>"+r.getInombre()+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                    out.print("<br><br><br><br>");
                    
                    out.print("<form class='formulario' action='CRUDRoles.jsp' method='post'>");

                        out.print("<div class='campo'>");
                        out.print("<label>ID</label>");
                        out.print("<input type='text' name='idecin' value='"+id+"' readonly>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>Nombre</label>");
                        out.print("<input type='text' name='nombrecin' value='"+r.getInombre()+"'>");
                        out.print("</div>");

                        out.print("<input type='submit' value='Actualizar' name='valida'>");

                        out.print("</form>");
                
                }
                
            }
        %>
 <div class="volver">

     <a href="../HTMLs/Roles.html">
        Regresar
    </a>

</div>

<crear-footer></crear-footer>
    </body>
</html>
