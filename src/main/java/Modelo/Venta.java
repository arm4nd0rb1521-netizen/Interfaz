package Modelo;

import java.sql.Timestamp;

public class Venta {
    private int idVenta;
    private String fecha;
    private int idUsuario;

    public Venta() {
    }

    public Venta(int idVenta, String fecha, int idUsuario) {
        this.idVenta = idVenta;
        this.fecha = fecha;
        this.idUsuario = idUsuario;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    
}
