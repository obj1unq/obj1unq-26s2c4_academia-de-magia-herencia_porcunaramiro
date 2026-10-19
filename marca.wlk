object acme {
  method aporte(cosa) = cosa.volumen() / 2
}
object fenix {
  method aporte(cosa) {
    if (cosa.esReliquia()){
        return 3
    }else{
        return 0
    }
  }
}
object cuchuflito {
  method aporte(cosa) = 0
}