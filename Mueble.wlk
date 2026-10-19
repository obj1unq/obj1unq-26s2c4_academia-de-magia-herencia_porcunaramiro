
import cosa.*
class Mueble {
    var  property elementosGuardados = []
    method tieneGuardado(cosa) = elementosGuardados.contains(cosa)
    method puedeGuardar(cosa) = not self.tieneGuardado(cosa)

    method validarSiEstaCosa(cosa){
        if(self.tieneGuardado(cosa)){
            self.error("Ya esta guardada")
        }
    }
    method validarSiPuedeCargarCosa(cosa){
        self.validarSiEstaCosa(cosa)
        if (not (self.puedeGuardar(cosa))){
            self.error("No se puede guardar cosa")
        }
    }

    method cargarElemento(cosa) {
      self.validarSiPuedeCargarCosa(cosa)
      elementosGuardados.add(cosa)
    }
    method estaVacia() = elementosGuardados.isEmpty()
    
    method precio()
    method utilidad() = elementosGuardados.sum({cosa => cosa.utilidad()}) / self.precio()
    method removerElemento(cosa) { elementosGuardados.remove(cosa) } 
    }


class Baul inherits Mueble{
    var capacidad = 0
    method capacidad(_capacidad) {
      capacidad = _capacidad
    }
    method pesoDeLosElementos() = elementosGuardados.sum({cosa => cosa.volumen()})
    method capacidadRestante() = capacidad - self.pesoDeLosElementos()
    
    override method puedeGuardar(cosa) =(super(cosa)) and (self.capacidadRestante() >= cosa.volumen())

    override method precio() = capacidad + 2

    method sonTodasReliquias() =  self.elementosGuardados().all({cosa=>cosa.esReliquia()}) 
    override method utilidad() = super() + (if (self.sonTodasReliquias()) 2 else 0) 
    

}
class BaulMagico inherits Baul{
    override method precio() = super()*2
    method cantidadDeElementosMagicos() = self.elementosGuardados().count({cosa => cosa.esMagico()})
    override method utilidad()= super() + self.cantidadDeElementosMagicos()
}

class GabineteMagico inherits Mueble{
    var property precio = 0 
    override method puedeGuardar(cosa) = (super(cosa) )and (cosa.esMagico())
    
    override method precio() = precio
}

class ArmarioConvencional inherits Mueble{
    var  property cantidadDeAlmacenamiento = 0
    
    override method precio() = cantidadDeAlmacenamiento * 5
    override method puedeGuardar(cosa) = (super(cosa) )and (elementosGuardados.size() < cantidadDeAlmacenamiento)
}

