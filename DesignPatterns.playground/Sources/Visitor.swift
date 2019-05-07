import Foundation

/*
 NameVisitor 안쪽만 수정해주면
 Planet 상속받은 애들이 제각각 행동하고 새로운거 추가한다 해도 동작한다는거지.
 어차피 행동의 정의는 visitor에 있으니까. 모듈을 주입하는 느낌인가.
 */
protocol PlanetVisitor {
    func visit(planet: PlanetAlderaan)
    func visit(planet: PlanetCoruscnat)
    func visit(planet: MoonJedha)
}

protocol Planet {
    func accept(visitor: PlanetVisitor)
}

final class MoonJedha: Planet {
    func accept(visitor: PlanetVisitor) {
        visitor.visit(planet: self)
    }
}

final class PlanetAlderaan: Planet {
    func accept(visitor: PlanetVisitor) {
        visitor.visit(planet: self)
    }
}

final class PlanetCoruscnat: Planet {
    func accept(visitor: PlanetVisitor) {
        visitor.visit(planet: self)
    }
}

final class NameVisitor: PlanetVisitor {
    func visit(planet: PlanetAlderaan) {
        name = "Alderaan"
    }
    
    func visit(planet: PlanetCoruscnat) {
        name = "Coruscnat"
    }
    
    func visit(planet: MoonJedha) {
        name = "MoonJedha"
    }
    
    var name = ""
}

let planets: [Planet] = [PlanetAlderaan(), PlanetCoruscnat(), MoonJedha()]

let names = planets.map { (planet: Planet) -> String in
    let visitor = NameVisitor()
    
    planet.accept(visitor: visitor)
    
    return visitor.name
}
