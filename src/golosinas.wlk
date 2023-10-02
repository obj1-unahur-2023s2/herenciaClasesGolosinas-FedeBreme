/*
 * Los sabores
 */
object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }


/*
 * Golosinas
 */
class Bombon {
    var peso = 15
    
    method precio() { return 5 }
    method peso() { return peso }
    method mordisco() { peso = peso * 0.8 - 1 }
    method sabor() { return frutilla }
    method libreGluten() { return true }
}


class Alfajor {
    var peso = 15
    
    method precio() { return 12 }
    method peso() { return peso }
    method mordisco() { peso = peso * 0.8 }
    method sabor() { return chocolate }
    method libreGluten() { return false }
}

class Caramelo {
    var peso = 5
    var property sabor = frutilla

    method precio() { return 12 }
    method peso() { return peso }
    method mordisco() { peso = peso - 1 }
    method libreGluten() { return true }
}


class Chupetin {
    var peso = 7
    
    method precio() { return 2 }
    method peso() { return peso }
    method mordisco() {
   	 if (peso >= 2) {
   		 peso = peso * 0.9
   	 }
    }
    method sabor() { return naranja }
    method libreGluten() { return true }
}

class Oblea {
    var peso = 250
    
    method precio() { return 5 }
    method peso() { return peso }
    method mordisco() {
   	 if (peso >= 70) {
   		 // el peso pasa a ser la mitad
   		 peso = peso * 0.5
   	 } else {
   		 // pierde el 25% del peso
   		 peso = peso - (peso * 0.25)
   	 }
    }    
    method sabor() { return vainilla }
    method libreGluten() { return false }
}

class Chocolatin {
    // hay que acordarse de *dos* cosas, el peso inicial y el peso actual
    // el precio se calcula a partir del precio inicial
    // el mordisco afecta al peso actual
    var pesoInicial
    var comido = 0
    
    method pesoInicial(unPeso) { pesoInicial = unPeso }
    method precio() { return pesoInicial * 0.50 }
    method peso() { return (pesoInicial - comido).max(0) }
    method mordisco() { comido = comido + 2 }
    method sabor() { return chocolate }
    method libreGluten() { return false }

}

class GolosinaBaniada {
    var property golosinaInterior
    var pesoBanio = 4
    
    method precio() { return golosinaInterior.precio() + 2 }
    method peso() { return golosinaInterior.peso() + pesoBanio }
    method mordisco() {
   	 golosinaInterior.mordisco()
   	 pesoBanio = (pesoBanio - 2).max(0)
    }    
    method sabor() { return golosinaInterior.sabor() }
    method libreGluten() { return golosinaInterior.libreGluten() }    
}


class Tuttifrutti {
    var libreDeGluten
    const sabores = [frutilla, chocolate, naranja]
    var saborActual = 0
    
    method mordisco() { saborActual += 1 }    
    method sabor() { return sabores.get(saborActual % 3) }    

    method precio() { return (if(self.libreGluten()) 7 else 10) }
    method peso() { return 5 }
    method libreGluten() { return libreDeGluten }    
    method libreGluten(valor) { libreDeGluten = valor }
}

//nuevo

class BombonesDuros inherits Bombon{
    
    override method mordisco() { peso = peso - 1 }
    
    method dureza() {
   	 return if(peso > 12) {3} else if(peso.between(8,12)) {2} else {1}
    }
}

class CarameloDeDistitosSabores inherits Caramelo {
    
    override method sabor() {
   	 return sabor
    }
}

class CaramelosRelleno inherits Caramelo {

    override method mordisco() {
   	 super()
   	 sabor = chocolate
    }
    
    override method precio() {
   	 return super() + 1
    }
}

class ObleasCrujientes inherits Oblea {
    var mordiscosRecibidos
    
    override method mordisco() {
   	 if (!self.estaDebil()) {
   		 peso = peso - 1
   	 } else if (peso >= 70){
   		 peso = peso * 0.5
   	 } else {
   		 peso = peso - (peso * 0.25)
   	 }
    }
    
    method estaDebil() {
   	 return mordiscosRecibidos > 3
    }
}

object heladeraDeMariano {
	var property humedad = 0.2
}

class ChocolatinesVip inherits Chocolatin {
    
    override method peso() {
   	 return super() * (1 + self.humedad())
    }
    
    method humedad() {
    	return heladeraDeMariano.humedad()
    }
}

class ChocolatinesPremium inherits ChocolatinesVip {
    
    override method humedad() {
   	    return super() / 2
    }
}
