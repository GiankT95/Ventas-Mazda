
import Modelo.ServicioRegistro;
import Modelo.Catalogo;
import Modelo.Producto;
import Modelo.*;
import Modelo.Usuario;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Sala_04
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {

        Usuario u = ServicioLogin.instance().buscarUsuarioPorNombre("Ana");
        List<CarroCompras> lista = ServicioLogin.instance().listaCarritos(u);
        Producto producto = ServicioLogin.instance().solicitarProducto(1);
        
        DecimalFormat d = new DecimalFormat("$###,###.###");
        
        for (CarroCompras carrito : lista) {
            if (carrito.getEstado().equalsIgnoreCase("activo")) {
                
                Set<Producto> productos = carrito.getProductos();
                
                double total;
                double total1 = 0;
                double total2 = 0;
                
                for (Producto p : productos){
                    
                    if(p.getAccesorio() != null){
                        total1 = total1+ p.getAccesorio().getPrecio();
                    }
                    
                    if(p.getVehiculo() != null){
                        total2 = total2 + p.getVehiculo().getPrecio();
                    }
                    
                }
                
                total = total1 + total2;
                
                System.out.println(d.format(total));
                
            }
        }
        
        
    }
    
}
