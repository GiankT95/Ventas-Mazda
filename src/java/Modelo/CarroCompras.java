package Modelo;
// Generated 16-nov-2017 23:15:29 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * CarroCompras generated by hbm2java
 */
public class CarroCompras  implements java.io.Serializable {


     private Integer idCarroCompras;
     private Pedido pedido;
     private Usuario usuario;
     private Set productos = new HashSet();

    public CarroCompras() {
    }

	
    public CarroCompras(Pedido pedido, Usuario usuario) {
        this.pedido = pedido;
        this.usuario = usuario;
    }
    public CarroCompras(Pedido pedido, Usuario usuario, Set productos) {
       this.pedido = pedido;
       this.usuario = usuario;
       this.productos = productos;
    }
   
    public Integer getIdCarroCompras() {
        return this.idCarroCompras;
    }
    
    public void setIdCarroCompras(Integer idCarroCompras) {
        this.idCarroCompras = idCarroCompras;
    }
    public Pedido getPedido() {
        return this.pedido;
    }
    
    public void setPedido(Pedido pedido) {
        this.pedido = pedido;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public Set getProductos() {
        return this.productos;
    }
    
    public void setProductos(Set productos) {
        this.productos = productos;
    }




}


