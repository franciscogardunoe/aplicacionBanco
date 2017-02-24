/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filtro;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import java.util.Map;

/**
 *
 * @author redes1
 */
public class InterceptorSesion implements Interceptor{

    @Override
    public void destroy() {
        
    }

    @Override
    public void init() {
        
    }

    @Override
    public String intercept(ActionInvocation actionInvocado) throws Exception {
       Map session=actionInvocado.getInvocationContext().getSession();
        System.out.println("Estamos revisando si tiene sesión");
        if(session.containsKey("logueado")){
            System.out.println("Lo ejecutaremos");
            String resultado=actionInvocado.invoke();
            System.out.println("Ya se ejecuto! y nos salimos");
            return resultado;
        }else{
            System.out.println("No esta logueado lo mandamos al login");
            return "noLogin";
        }
    }
    
}
