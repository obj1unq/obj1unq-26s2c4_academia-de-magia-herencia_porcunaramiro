
import marca.*
class Cosa {
    var property marca = acme
    var property volumen = 0
    var property esReliquia = false 
    var property esMagico = false

    method utilidad() = volumen + (if (esMagico) 3 else 0  )+ (if (esReliquia) 5 else 0) + (marca.aporte(self))

}