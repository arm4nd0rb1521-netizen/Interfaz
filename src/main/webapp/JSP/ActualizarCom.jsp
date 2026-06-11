<%@page import="DAO.CompraDAO"%>
<%@page import="Modelo.Compra" %>
<html>
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8">

    <title>Actualizar detalle de compra</title>

    <link rel="stylesheet" href="../CSS/gen_logistica.css"/>
    <link rel="stylesheet" href="../CSS/tablas.css"/>
    <link rel="stylesheet" href="../CSS/formularios _Actualizar.css"/>
    <link rel="stylesheet" href="../CSS/footerr.css"/>
    <link rel="stylesheet" href="../CSS/header.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="../miHeader.js"></script>
    <script src="../miFooter.js"></script>
</head>

    <body>
<crear-header></crear-header>        
        <%
            try {
                 CompraDAO dtdao = new CompraDAO();

                if(request.getParameter("actualizar") != null)  {
                    int id = Integer.parseInt(request.getParameter("id_actualizar"));

                    Compra dt =  dtdao.buscarUno(id);
                    if(dt != null) {

                        out.print("<h2>Detalle de compra</h2>");
                        out.print("<table>");
                        out.print("<tr>");

                        out.print("<th>ID</th>");
                        out.print("<th>Fecha</th>");
                        out.print("<th>Total</th>");
                        out.print("<th>ID proveedor</th>");
                        out.print("<th>ID usuario</th>");
                        out.print("<th>Nombre del usuario</th>");
                        out.print("<th>Nombre del preveedor</th>");

                        out.print("</tr>");

                        out.print("<tr>");

                        out.print("<td>"+id+"</td>");
                        out.print("<td>"+dt.getFecha()+"</td>");
                        out.print("<td>"+dt.getTotal()+"</td>");
                        out.print("<td>"+dt.getIdProveedor()+"</td>");
                        out.print("<td>"+dt.getIdUsuario()+"</td>");
                        out.print("<td>"+dt.getNombreUsuario()+"</td>");
                        out.print("<td>"+dt.getNombreProv()+"</td>");

                        out.print("</tr>");
                        out.print("</table>");
                        out.print("<br><br><br><br>");

                       out.print("<form class='formulario' action='CRUDCompras.jsp' method='post'>");

                                    out.print("<div class='campo'>");
                                    out.print("<label>ID Compra</label>");
                                    out.print("<input type='text' name='idecin' value='"+dt.getIdCompra()+"' readonly>");
                                    out.print("</div>");

                                    out.print("<div class='campo'>");
                                    out.print("<label>Fecha</label>");
                                    out.print("<input type='date' name='fecha' value='"+dt.getFecha()+"'>");
                                    out.print("</div>");

                                    out.print("<div class='campo'>");
                                    out.print("<label>Total</label>");
                                    out.print("<input type='text' name='total' value='"+dt.getTotal()+"'>");
                                    out.print("</div>");

                                    out.print("<div class='campo'>");
                                    out.print("<label>ID Usuario</label>");
                                    out.print("<input type='text' name='usuario' value='"+dt.getIdUsuario()+"'>");
                                    out.print("</div>");

                                    out.print("<input type='submit' name='valida' value='Actualizar'>");

                                    out.print("</form>");

                    }

                }
            } catch(Exception e) {
                %>
                <script>
                    alert('Ocurrio un error inesperado');
                    history.back();
                </script>
                <%
            }
        %>
 <div class="volver">

     <a href="../HTMLs/Compras.html">
        Regresar
    </a>

</div>

<crear-footer></crear-footer>
    </body>
</html>

