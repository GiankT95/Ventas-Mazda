package Modelo;
// Generated 20-nov-2017 16:59:07 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Accesorio generated by hbm2java
 */
public class Accesorio  implements java.io.Serializable {


     private Integer idAccesorio;
     private String nombre;
     private double precio;
     private int stock;
     private Set productos = new HashSet(0);

    public Accesorio() {
    }

	
    public Accesorio(String nombre, double precio, int stock) {
        this.nombre = nombre;
        this.precio = precio;
        this.stock = stock;
    }
    public Accesorio(String nombre, double precio, int stock, Set productos) {
       this.nombre = nombre;
       this.precio = precio;
       this.stock = stock;
       this.productos = productos;
    }
   
    public Integer getIdAccesorio() {
        return this.idAccesorio;
    }
    
    public void setIdAccesorio(Integer idAccesorio) {
        this.idAccesorio = idAccesorio;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public double getPrecio() {
        return this.precio;
    }
    
    public void setPrecio(double precio) {
        this.precio = precio;
    }
    public int getStock() {
        return this.stock;
    }
    
    public void setStock(int stock) {
        this.stock = stock;
    }
    public Set getProductos() {
        return this.productos;
    }
    
    public void setProductos(Set productos) {
        this.productos = productos;
    }




}


