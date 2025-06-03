import plagas.*

class Hogar {
    var mugre 
    const confort 
    method esBueno() = mugre <= confort / 2
    method recibeAtaque(plaga) {
        mugre += plaga.daño()
    }
}

class Huerta {
    var capacidadProduccion
    method esBueno() = capacidadProduccion > nivelMinimoProduccion.valor()

    method recibeAtaque(plaga) {

        capacidadProduccion -= plaga.daño() * 0.1
        if (plaga.transmiteEnfermedades()){
            capacidadProduccion = (capacidadProduccion - 10).max(0)
        }

    }
}

object nivelMinimoProduccion{
    var property valor = 100

    method recibeAtaque(plaga) {
      
    }
}

class Mascota {
    var salud

    method esBueno() = salud > 250

    method recibeAtaque(plaga) {
        if (plaga.transmiteEnfermedades()){
            salud = (salud - plaga.daño()).max(0)
        }
    }
}

class Barrio{
    const elementos = []

    method esBueno(elemento) = elemento.esBueno()

    method esCopado() = elementos.count({e => e.esBueno()}) > elementos.count({e => not e.esBueno()}) 
}
