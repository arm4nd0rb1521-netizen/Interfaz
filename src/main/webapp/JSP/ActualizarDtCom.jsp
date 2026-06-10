<%@page import="DAO.DetalleCompraDAO"%>
<%@page import="Modelo.DetalleCompra" %>
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
            DetalleCompraDAO dtdao = new DetalleCompraDAO();
            
            if(request.getParameter("actualizar") != null)  {
                int id = Integer.parseInt(request.getParameter("id_actualizar"));
                
                DetalleCompra dt =  dtdao.buscarUno(id);
                if(dt != null) {
                
                    out.print("<h2>Detalle de compra</h2>");
                    out.print("<table>");
                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Cantidad</th>");
                    out.print("<th>Precio unitario</th>");
                    out.print("<th>Subtotal</th>");
                    out.print("<th>ID de la compra</th>");
                    out.print("<th>ID del producto</th>");

                    out.print("</tr>");
                    
                    out.print("<tr>");
                    
                    out.print("<td>"+id+"</td>");
                    out.print("<td>"+dt.getCantidad()+"</td>");
                    out.print("<td>"+dt.getPrecioUnitario()+"</td>");
                    out.print("<td>"+dt.getSubtotal()+"</td>");
                    out.print("<td>"+dt.getIdCompra()+"</td>");
                    out.print("<td>"+dt.getIdProducto()+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                    out.print("<br><br><br><br>");
                    
                    out.print("<form class='formulario' action='RegistrarDetalleCompra.jsp' method='post'>");

                        out.print("<div class='campo'>");
                        out.print("<label>ID</label>");
                        out.print("<input type='text' name='idecin' value='"+id+"' readonly>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>Cantidad</label>");
                        out.print("<input type='text' name='cantidad' value='"+dt.getCantidad()+"'>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>Precio unitario</label>");
                        out.print("<input type='text' name='precioU' value='"+dt.getPrecioUnitario()+"'>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>Subtotal</label>");
                        out.print("<input type='text' name='subtotal' value='"+dt.getSubtotal()+"'>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>ID compra</label>");
                        out.print("<input type='text' name='idCompra' value='"+dt.getIdCompra()+"'>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>ID producto</label>");
                        out.print("<input type='text' name='idProd' value='"+dt.getIdProducto()+"'>");
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

<crear-footer></crear-footer>
    </body>
</html>
