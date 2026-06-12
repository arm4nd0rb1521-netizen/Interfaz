<%@page import="DAO.ProductoDAO" %>
<%@page import="Modelo.Producto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="../CSS/gen_logistica.css"/>
    <link rel="stylesheet" href="../CSS/tablas.css"/>
    <link rel="stylesheet" href="../CSS/formularios _Actualizar.css"/>
    <link rel="stylesheet" href="../CSS/footerr.css"/>
    <link rel="stylesheet" href="../CSS/header.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="../miHeader.js"></script>
    <script src="../miFooter.js"></script>
        <title>Usuarios</title>

    </head>
    <crear-header></crear-header>        

    <body>
        <%
            try {
                ProductoDAO pdao = new ProductoDAO();

                if(request.getParameter("actualizar") != null)  {
                    int id = Integer.parseInt(request.getParameter("id_actualizar"));

                    Producto p =  pdao.buscarUno(id);
                    if(p != null) {

                        out.print("<h2>Usuario</h2>");
                        out.print("<table>");
                        out.print("<tr>");

                        out.print("<th>ID</th>");
                        out.print("<th>Nombre</th>");
                        out.print("<th>Precio</th>");
                        out.print("<th>Stock</th>");
                        out.print("<th>Stock minimo</th>");
                        out.print("<th>Categoria</th>");

                        out.print("</tr>");

                        out.print("<tr>");

                        out.print("<td>"+id+"</td>");
                        out.print("<td>"+p.getNombre()+"</td>");
                        out.print("<td>"+p.getPrecio()+"</td>");
                        out.print("<td>"+p.getStock()+"</td>");
                        out.print("<td>"+p.getStockMinimo()+"</td>");
                        out.print("<td>"+p.getNombreCategoria()+"</td>");

                        out.print("</tr>");

                        out.print("</table>");
                        out.print("<br><br><br><br>");

                        out.print("<form action='CRUDProductos.jsp' method='post' name='actualiza' class='formulario'>");

                        out.print("<div class='campo'>");
                        out.print("<label>ID</label>");
                        out.print("ID: <input type='text' name='idecin' value='"+id+"' readonly><br><br>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>Nombre</label>");
                        out.print("Nombre: <input type='text' name='nombrecin' value='"+p.getNombre()+"'><br><br>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>Precio</label>");
                        out.print("Precio: <input type='text' name='preciecin' value='"+p.getPrecio()+"'><br><br>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>Stock</label>");
                        out.print("Stock: <input type='text' name='stockin' value='"+p.getStock()+"'><br><br>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>Stock mínimo</label>");
                        out.print("Stock minimo: <input type='text' name='stMin' value='"+p.getStockMinimo()+"'><br><br>");
                        out.print("</div>");

                        out.print("<div class='campo'>");
                        out.print("<label>Categoría</label>");
                        out.print("Categoria: <input type='text' name='cat' value='"+p.getIdCategoria()+"'><br><br>");
                        out.print("</div>");

                        out.print("<input type='submit' value='Actualizar' name='valida'>");
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
        <a href="../HTMLs/Productos.html">Regresar</a>
        <crear-footer></crear-footer>

    </body>
</html>
