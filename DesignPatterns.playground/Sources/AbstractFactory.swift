import Foundation

/*
 다양한 구성 요소 별로 '객체의 집합'을 생성할 때 유용하다구..?
 runtime에 객체 생성.

 음... 이게 맞는지 모르겠네...
 */

protocol BurgerDescribing {     // 상위 구현체 1
    var ingredients: [String] { get }
}

struct CheeseBurger: BurgerDescribing {
    let ingredients: [String]
}

protocol BurgerMaking {         // 상위 구현체 2
    func make() -> BurgerDescribing
}

final class BigKahunaBurger: BurgerMaking { // 하위 구현체 1
    func make() -> BurgerDescribing {
        return CheeseBurger(ingredients: ["Cheese", "Burger", "Lettuce", "Tomato"])
    }
}

final class JackInTheBox: BurgerMaking {    // 하위 구현체 2
    func make() -> BurgerDescribing {
        return CheeseBurger(ingredients: ["Burger", "Onion", "source"])
    }
}

enum BurgerFactoryType: BurgerMaking {  // factory
    case bigKahuna
    case jackInTheBox
    
    func make() -> BurgerDescribing {
        switch self {
        case .bigKahuna:
            return BigKahunaBurger().make()
        case .jackInTheBox:
            return JackInTheBox().make()
        }
    }
}

/*
let bigKahuna = BurgerFactoryType.bigKahuna.make()
let jackInTheBox = BurgerFactoryType.jackInTheBox.make()

bigKahuna.ingredients
jackInTheBox.ingredients
 */
