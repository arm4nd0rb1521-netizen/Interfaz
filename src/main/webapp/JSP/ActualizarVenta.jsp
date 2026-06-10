<%@page import="Modelo.Venta" %>
<%@page import="DAO.VentaDAO" %>
<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8">

    <title>Actualizar Venta</title>

    <link rel="stylesheet" href="../CSS/gen_logistica.css"/>
    <link rel="stylesheet" href="../CSS/tablas.css"/>
    <link rel="stylesheet" href="../CSS/formularios _Actualizar.css"/>
    <link rel="stylesheet" href="../CSS/footerr.css"/>
    <link rel="stylesheet" href="../CSS/header.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="../miHeader.js"></script>
    <script src="../miFooter.js"></script>
    <crear-header></crear-header>        

</head>

    <body>
        <%
            VentaDAO rdao = new VentaDAO();
            
            if(request.getParameter("actualizar") != null)  {
                int id = Integer.parseInt(request.getParameter("id_actualizar"));
                
                Venta v =  rdao.buscarUno(id);
                if(v != null) {
                
                    out.print("<h2>Venta</h2>");
                    out.print("<table>");
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Fecha</th>");
                    out.print("<th>Id usuario</th>");
                    out.print("</tr>");
                    
                    out.print("<tr>");
                    
                    out.print("<td>"+id+"</td>");
                    out.print("<td>"+v.getFecha()+"</td>");
                    out.print("<td>"+v.getIdUsuario()+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                    out.print("<br><br><br><br>");
                    
                    out.print("<form class='formulario' action='CRUDVentas.jsp' method='post'>");

                        out.print("<div class='campo'>");
                        out.print("<label>ID</label>");
                        out.print("<input type='text' name='idecin' value='"+id+"' readonly>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>Fecha</label><br>");
                        out.print("<input type='text' name='nombrecin' value='"+v.getFecha()+"'><br><br>");
                        out.print("<label>ID del usuario</label><br>");
                        out.print("<input type='text' name='usuario' value='"+v.getIdUsuario()+"'><br><br>");
                        out.print("</div>");

                        out.print("<input type='submit' value='Actualizar' name='valida'>");

                        out.print("</form>");
                
                }
                
            }
        %>
 <div class="volver">

    <a href="../HTMLs/Proveedores.html">
        Regresar
    </a>

</div>

    </body>
             <crear-footer></crear-footer>

</html>
