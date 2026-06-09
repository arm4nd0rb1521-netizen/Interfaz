<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto" %>
<%@page import="DAO.ProductoDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="../CSS/gen_logistica.css"/>

     <link rel="stylesheet" href="../CSS/tablas.css"/>
    <link rel="stylesheet" href="../CSS/footerr.css"/>
    <link rel="stylesheet" href="../CSS/header.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <script src="../miHeader.js"></script>
    <script src="../miFooter.js"></script>
        <title>Productos</title

    </head>
                        <crear-header></crear-header>

    <body>

        <%
            ProductoDAO pdao = new ProductoDAO();
            
            List <Producto> productos = new ArrayList<>();
            
            if(request.getParameter("registrar") != null) {
                Producto p = new Producto();
                p.setNombre(request.getParameter("nombre"));
                p.setPrecio(Double.parseDouble(request.getParameter("precio")));
                p.setStock(Integer.parseInt(request.getParameter("stock")));
                p.setStockMinimo(Integer.parseInt(request.getParameter("stockMin")));
                p.setIdCategoria(Integer.parseInt(request.getParameter("idCat")));
                
                if(pdao.insertar(p)){
                    out.print("<script>alert('Producto registrado');</script>");
                } else{
                    out.print("<script>alert('Error al registrar');</script>");
                }
            }
            
            if(request.getParameter("eliminar") != null) {
                int id = Integer.parseInt(request.getParameter("id_eliminar"));
                
                if(pdao.eliminar(id)) {
                    out.print("<script>alert('Producto eliminado');</script>");
                } else{
                    out.print("<script>alert('Error al eliminar');</script>");
                }
            }
            
            if(request.getParameter("consultar_user") != null) {
                int id = Integer.parseInt(request.getParameter("id_consultar"));
                Producto p = pdao.buscarUno(id);
                
                if(p != null) {
                    out.print("<script>alert('Consulta realizada')</script>");
                    
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
                    
                    out.print("<td>"+p.getIdProducto()+"</td>");
                    out.print("<td>"+p.getNombre()+"</td>");
                    out.print("<td>"+p.getPrecio()+"</td>");
                    out.print("<td>"+p.getStock()+"</td>");
                    out.print("<td>"+p.getStockMinimo()+"</td>");
                    out.print("<td>"+p.getNombreCategoria()+"</td>");
                    
                    out.print("</tr>");
                    out.print("</table>");
                } else {
                    out.print("<script>alert('Producto no encontrado')</script>");
                }
            }
            
            if(request.getParameter("consultar_todo") != null) {
                productos = pdao.buscarTodo();
                
                if(!productos.isEmpty()) {
                    out.print("<script>alert('Mostrando registros');</script>");
                    
                    out.print("<table border='1'>");

                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Nombre</th>");
                    out.print("<th>Precio</th>");
                    out.print("<th>Stock</th>");
                    out.print("<th>Stock minimo</th>");
                    out.print("<th>Categoria</th>");
                    
                    out.print("</tr>");

                    for(Producto p : productos) {

                        out.print("<tr>");

                        out.print("<td>"+p.getIdProducto()+"</td>");
                        out.print("<td>"+p.getNombre()+"</td>");
                        out.print("<td>"+p.getPrecio()+"</td>");
                        out.print("<td>"+p.getStock()+"</td>");
                        out.print("<td>"+p.getStockMinimo()+"</td>");
                        out.print("<td>"+p.getNombreCategoria()+"</td>");

                        out.print("</tr>");
                    }

                    out.print("</table>");

                } else {

                    out.print("<script>alert('No hay productosregistrados');</script>");

                }
            }

            if(request.getParameter("valida") != null) {

                Producto p = new Producto();

                p.setIdProducto(
                    Integer.parseInt(
                        request.getParameter("idecin")
                    )
                );

                p.setNombre(
                    request.getParameter("nombrecin")
                );

                p.setPrecio(
                    Double.parseDouble(request.getParameter("preciecin"))
                );

                p.setStock(
                    Integer.parseInt(request.getParameter("stockin"))
                );
                
                p.setStockMinimo(
                    Integer.parseInt(request.getParameter("stMin"))
                );
                
                p.setIdCategoria(
                    Integer.parseInt(request.getParameter("cat"))
                );

                if(pdao.actualizar(p)) {

                    out.print(
                        "<script>alert('Producto actualizado');</script>"
                    );

                } else {

                    out.print(
                        "<script>alert('Error al actualizar');</script>"
                    );
                }
            }
        %>
        
        <a href="../HTMLs/Productos.html">Regresar</a>

    </body>
                <crear-footer></crear-footer>   

</html>
