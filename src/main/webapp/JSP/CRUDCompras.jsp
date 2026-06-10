<%@page import="Modelo.Compra"%>
<%@page import="DAO.CompraDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Venta" %>
<%@page import="DAO.VentaDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <title>Productos</title>
    </head>
     <crear-header></crear-header>
    <body>
        <h1>Compras</h1>
               
        <%
          CompraDAO cdao = new CompraDAO();
            
            List <Compra> compras = new ArrayList<>();
            
            if(request.getParameter("registrar") != null) {
                Compra c = new Compra();
                c.setFecha(request.getParameter("compra"));
                c.setTotal(Double.parseDouble(request.getParameter("total")));
                c.setIdProveedor(Integer.parseInt(request.getParameter("id_prov")));
                c.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
                
                if(cdao.insertar(c)){
                } else{
                    out.print("<script>alert('Error al registrar');</script>");
                }
                               out.print("<form action='RegistrarDetalleCompra.jsp' "
        + "method='post' "
        + "name='reg_dtcompra' "
        + "class='formulario'>");

                                    out.print("<div class='campo'>");
                                    out.print("<label>ID de la compra</label>");
                                    out.print("<input type='text' name='id'>");
                                    out.print("</div>");

                                    out.print("<div class='campo'>");
                                    out.print("<label>Fecha</label>");
                                    out.print("<input type='text' name='fecha' value='"+c.getFecha()+"' readonly>");
                                    out.print("</div>");

                                    out.print("<div class='campo'>");
                                    out.print("<label>Subtotal</label>");
                                    out.print("<input type='text' name='total' value='"+c.getTotal()+"' readonly>");
                                    out.print("</div>");

                                    out.print("<div class='campo'>");
                                    out.print("<label>ID del producto</label>");
                                    out.print("<input type='text' name='prod' value='"+c.getIdUsuario()+"' readonly>");
                                    out.print("</div>");

                                    out.print("<div class='campo'>");
                                    out.print("<label>Cantidad</label>");
                                    out.print("<input type='text' name='cantidad'>");
                                    out.print("</div>");

                                    out.print("<div class='campo'>");
                                    out.print("<label>Precio unitario</label>");
                                    out.print("<input type='text' name='prec'>");
                                    out.print("</div>");

                                    out.print("<input type='submit' "
                                            + "name='crear_detalle' "
                                            + "value='Registrar detalle'>");

                                    out.print("</form>");
            }
            
            if(request.getParameter("consultar_todo") != null) {
                compras = cdao.buscarTodo();
                
                if(!compras.isEmpty()) {
                    
                    out.print("<table border='1'>");

                    out.print("<tr>");
                    
                    out.print("<th>ID</th>");
                    out.print("<th>Fecha </th>");
                    out.print("<th>Total </th>");
                    out.print("<th>Proveedor</th>");
                    out.print("<th>Usuario</th>");
                    
                    
                    out.print("</tr>");

                    for(Compra c: compras) {

                        out.print("<tr>");

                  out.print("<td>"+c.getIdCompra()+"</td>");
                    out.print("<td>"+c.getFecha()+"</td>");
                    out.print("<td>"+c.getTotal()+"</td>");
                    out.print("<td>"+c.getNombreProv()+"</td>");
                    out.print("<td>"+c.getNombreUsuario()+"</td>");

                        out.print("</tr>");
                    }

                    out.print("</table>");

                } else {

                    out.print("<script>alert('No hay compras realizadas');</script>");

                }
          
            }
            if(request.getParameter("eliminar") != null) {
                int id = Integer.parseInt(request.getParameter("id_eliminar"));
                
                if(cdao.eliminar(id)) {
                } else{
                    out.print("<script>alert('Error al eliminar');</script>");
                }
            }
            
                    if(request.getParameter("valida") != null){

                        Compra c = new Compra();

                        c.setIdCompra(
                            Integer.parseInt(
                                request.getParameter("idecin")
                            )
                        );

                        c.setFecha(
                            request.getParameter("fecha")
                        );

                        c.setTotal(
                            Double.parseDouble(
                                request.getParameter("total")
                            )
                        );

                        c.setIdUsuario(
                            Integer.parseInt(
                                request.getParameter("usuario")
                            )
                        );

                        // mantener proveedor actual
                        Compra aux = cdao.buscarUno(c.getIdCompra());

                        if(aux != null){
                            c.setIdProveedor(aux.getIdProveedor());
                        }

                        if(cdao.actualizar(c)){


                        }else{

                            out.print(
                                "<script>alert('Error al actualizar');</script>"
                            );

                        }
                    }
        %>
               
   
         <div class="volver">

             <a href="../HTMLs/DetalleCompra.html">
        Regresar
    </a>    
 </div>
         <crear-footer></crear-footer>
    </body>
</html>

