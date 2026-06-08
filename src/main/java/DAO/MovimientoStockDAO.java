package DAO;

import Modelo.MovimientoStock;
import conexion.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MovimientoStockDAO {
    
    public ArrayList<MovimientoStock> buscarTodo() {
        ArrayList<MovimientoStock> movimientos = new ArrayList<>();

        try {
            Connection con = Conexion.getConexion();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM movimiento_stock;");
            
            while(rs.next()) {
                MovimientoStock ms = new MovimientoStock();
                
                ms.setCantidad(rs.getInt("cantidad"));
                ms.setTipo(rs.getString("tipo"));
                ms.setFecha(rs.getTimestamp("fecha"));
                ms.setCantidad(rs.getInt("cantidad"));
                ms.setIdProducto(rs.getInt("id_producto"));
                ms.setIdUsuario(rs.getInt("id_usuario"));
                
                movimientos.add(ms);
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return movimientos;
    }
}
