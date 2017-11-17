package Modelo;
// Generated 16-nov-2017 23:15:29 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Pedido generated by hbm2java
 */
public class Pedido  implements java.io.Serializable {


     private Integer idPedido;
     private double monto;
     private Date fecha;
     private Set documentos = new HashSet(0);
     private Set carroComprases = new HashSet(0);

    public Pedido() {
    }

	
    public Pedido(double monto, Date fecha) {
        this.monto = monto;
        this.fecha = fecha;
    }
    public Pedido(double monto, Date fecha, Set documentos, Set carroComprases) {
       this.monto = monto;
       this.fecha = fecha;
       this.documentos = documentos;
       this.carroComprases = carroComprases;
    }
   
    public Integer getIdPedido() {
        return this.idPedido;
    }
    
    public void setIdPedido(Integer idPedido) {
        this.idPedido = idPedido;
    }
    public double getMonto() {
        return this.monto;
    }
    
    public void setMonto(double monto) {
        this.monto = monto;
    }
    public Date getFecha() {
        return this.fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public Set getDocumentos() {
        return this.documentos;
    }
    
    public void setDocumentos(Set documentos) {
        this.documentos = documentos;
    }
    public Set getCarroComprases() {
        return this.carroComprases;
    }
    
    public void setCarroComprases(Set carroComprases) {
        this.carroComprases = carroComprases;
    }




}

