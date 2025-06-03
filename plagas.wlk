class Plaga{
    var poblacion
    method transmiteEnfermedades() = poblacion >= 10 && self.condicionAdicional()
    method daño() = poblacion
    method condicionAdicional() = true
    
    method atacar(elemento) {
        poblacion *= 1.1
        elemento.recibirAtaque(self)

    }
}

class Cucarachas inherits Plaga{
    var pesoPromedio
    override method daño() = super() / 2
    override method condicionAdicional() = pesoPromedio >= 10 
    override method atacar(elemento){
        super(elemento)
        pesoPromedio += 2
    }
}

class Pulgas inherits Plaga{    
    override method daño() = super() * 2
}

class Garrapatas inherits Pulgas{
    override method atacar(elemento){
        elemento.recibirAtaque(self)
        poblacion *= 1.2
    }
}

class Mosquitos inherits Plaga{
    override method condicionAdicional() = poblacion % 3 == 0 
}

