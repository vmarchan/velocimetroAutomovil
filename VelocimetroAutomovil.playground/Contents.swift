//: Playground - noun: a place where people can play

import UIKit

//Velocities
enum Velocidades: Int {
    case Apagado = 0, VelocidadBaja = 20, VelocidadMedia = 50, VelocidadAlta = 120
    
    init(velocidadInicial: Velocidades) {
        self = velocidadInicial
    }
}

//Class
class Auto {
    var velocidad = Velocidades(velocidadInicial: .Apagado)
    var isIncremental : Bool
    
    init() {
        self.velocidad = Velocidades(velocidadInicial: .Apagado)
        isIncremental = true
    }
    
    func cambioDeVelocidad() -> (actual: Int, velocidadEnCadena: String) {
        
        switch velocidad {
            
        case Velocidades.Apagado:
            isIncremental = true
            velocidad = Velocidades(velocidadInicial: .VelocidadBaja)
            return (actual: Velocidades.Apagado.rawValue, velocidadEnCadena: "Apagado")
            
        case Velocidades.VelocidadBaja:
            if isIncremental {
                velocidad = Velocidades(velocidadInicial: .VelocidadMedia)
            } else {
                velocidad = Velocidades(velocidadInicial: .Apagado)
            }
            
            return (actual: Velocidades.VelocidadBaja.rawValue, velocidadEnCadena: "Velocidad baja")
            
        case Velocidades.VelocidadMedia:
            if isIncremental {
                velocidad = Velocidades(velocidadInicial: .VelocidadAlta)
            } else {
                velocidad = Velocidades(velocidadInicial: .VelocidadBaja)
            }
            
            return (actual: Velocidades.VelocidadMedia.rawValue, velocidadEnCadena: "Velocidad media")
            
        default:
            isIncremental = false
            velocidad = Velocidades(velocidadInicial: .VelocidadMedia)
            return (actual: Velocidades.VelocidadAlta.rawValue, velocidadEnCadena: "Velodidad alta")
        
        }
    }
}

var auto = Auto()

for i in 0..<20 {
    print(auto.cambioDeVelocidad())
}