<%@page import="DAO.ProductoDAO" %>
<%@page import="Modelo.Producto" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <body>
        <%
            ProductoDAO pdao = new ProductoDAO();
            
            if(request.getParameter("actualizar_prod") != null)  {
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
                    
                    out.print("<form action='CRUDProductos.jsp' method='post' name='actualiza'>");
                    
                    out.print("ID: <input type='text' name='idecin' value='"+id+"' readonly><br><br>");
                    out.print("Nombre: <input type='text' name='nombrecin' value='"+p.getNombre()+"'><br><br>");
                    out.print("Precio: <input type='text' name='preciecin' value='"+p.getPrecio()+"'><br><br>");
                    out.print("Stock: <input type='text' name='stockin' value='"+p.getStock()+"'><br><br>");
                    out.print("Stock minimo: <input type='text' name='stMin' value='"+p.getStockMinimo()+"'><br><br>");
                    out.print("Categoria: <input type='text' name='cat' value='"+p.getIdCategoria()+"'><br><br>");
                    
                    out.print("<input type='submit' value='Actualizar' name='valida'>");
                    out.print("</form>");
                
                }
                
            }
        %>
        <a href="../HTMLs/Productos.html">Regresar</a>
    </body>
</html>
