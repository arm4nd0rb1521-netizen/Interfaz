package Modelo;

import java.sql.Timestamp;

public class Venta {
    private int idVenta;
    private Timestamp fecha;
    private int idUsuario;

    public Venta() {
    }

    public Venta(int idVenta, Timestamp fecha, int idUsuario) {
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

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    
}
