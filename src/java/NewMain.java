
import Modelo.ServicioLogin;
import Modelo.Usuario;

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

        Usuario u = ServicioLogin.instance().buscarUsuarioPorNombre("giank");
        System.out.println(u.getNombre());
        
    }
    
}
