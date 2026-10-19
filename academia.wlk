import cosa.*
import Mueble.*



class Academia{
    var muebles = []
    method validarVacio() {
      if(muebles.isEmpty()){
        self.error("No hay muebles")
      }
    }
    method agregarMueble(mueble) { 
        muebles.add(mueble) 
        }
    //1
    method todosLosElementosDeLaAcademia() = muebles.flatMap({mueble=>mueble.elementosGuardados()}) 
    method estaGuardadaEnLaAcademia(cosa) = self.todosLosElementosDeLaAcademia().contains(cosa)  
    //1.2
    method validarSiEsta(cosa){
        if(not self.estaGuardadaEnLaAcademia(cosa)){
            self.error("No esta en la academia")
        }
    } 

    method estaGuardadoEn(cosa){
        self.validarSiEsta(cosa)
        return muebles.find({ mueble => mueble.tieneGuardado(cosa)})
    }
    //3
    method sePuedeGuardar(cosa) = not(self.estaGuardadaEnLaAcademia(cosa)) and muebles.any({ mueble => mueble.puedeGuardar(cosa) }) 
  
    //4 
    method enDondeSePuedeGuardar(cosa) {
      return muebles.filter({mueble => mueble.puedeGuardar(cosa)})
    }
    method validarSiSePuedeGuardar(cosa){
        if (not self.sePuedeGuardar(cosa) ){
            self.error("No se puede guardar")
        }
    }
    method guardarEnLaAcademia(cosa) {
      self.validarSiSePuedeGuardar(cosa)
      (self.enDondeSePuedeGuardar(cosa)).first().cargarElemento(cosa)
    }
    method menosUtiles(){
        self.validarVacio() 
        return muebles.map({mueble => mueble.elementosGuardados().min({cosa => cosa.utilidad()})}).asSet()
    }

    //2.3
    method marcaMenosUtil() = self.menosUtiles().min({cosa => cosa.utilidad()}).marca()
    
    //2.4
    method validarQueTieneMasDe3Muebles() {
      if(not (muebles.size()>=3)){
        self.error("No tiene mas de 3 muebles")
      }
    }
    method borrarMenosUtilesYNoMagica() {
      self.validarQueTieneMasDe3Muebles()
      const aRemover = self.menosUtiles().filter({ cosa => not cosa.esMagico() })
      aRemover.forEach({ cosa => const mueble = self.estaGuardadoEn(cosa) mueble.removerElemento(cosa)})
    }
    }

  



