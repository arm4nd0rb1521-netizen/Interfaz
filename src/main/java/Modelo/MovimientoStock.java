package Modelo;

import com.google.protobuf.Timestamp;

public class MovimientoStock {
     private int idMovimientoStock;
    private int cantidad;
    private String tipo;
    private Timestamp fecha;
    private int idProducto;
    private int idUsuario;
    private String descripcion;

    public MovimientoStock() {
    }

    public MovimientoStock(int idMovimientoStock, int cantidad, String tipo, Timestamp fecha, int idProducto, int idUsuario, String descripcion) {
        this.idMovimientoStock = idMovimientoStock;
        this.cantidad = cantidad;
        this.tipo = tipo;
        this.fecha = fecha;
        this.idProducto = idProducto;
        this.idUsuario = idUsuario;
        this.descripcion = descripcion;
    }

    public int getIdMovimientoStock() {
        return idMovimientoStock;
    }

    public void setIdMovimientoStock(int idMovimientoStock) {
        this.idMovimientoStock = idMovimientoStock;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
}
