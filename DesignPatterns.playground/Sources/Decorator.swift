import Foundation

/*
 객체의 기능을 런타임에 확장. 데코레이터 클래스로 래핑하면 이게 가능하대.
 
 흠 근데 프로토콜 내에서는 기능 가독성이 좀 떨어지는거 같은데. 한눈에 안 보이고 여기저기 찾아가야 한다는 느낌이야.
 decorate 하기위해 객체를 만들어야만 하는것ㄷ 좀 이상하긴 하다. 여기서만 그런거겠지.
 */

protocol CostHaving {
    var cost: Double { get }
}

protocol IngredientsHaving {
    var ingredients: [String] { get }
}

typealias BeverageDataHaving = CostHaving & IngredientsHaving

struct SimpleCoffee: BeverageDataHaving {
    let cost: Double = 1.0
    let ingredients: [String] = ["Water", "Coffee"]
}

protocol BeverageHaving: BeverageDataHaving {
    var beverage: BeverageDataHaving { get }
}

struct Milk: BeverageHaving {
    let beverage: BeverageDataHaving
    
    var cost: Double {
        return beverage.cost + 0.5
    }
    
    var ingredients: [String] {
        return beverage.ingredients + ["Milk"]
    }
}

struct WhipCoffee: BeverageHaving {
    let beverage: BeverageDataHaving
    
    var cost: Double {
        return beverage.cost + 1.2
    }
    
    var ingredients: [String] {
        return beverage.ingredients + ["Whip"]
    }
}
/*
var someCoffee: BeverageDataHaving = SimpleCoffee()
print("ingredient: \(someCoffee.ingredients)")
someCoffee = Milk(beverage: someCoffee)
print("ingredient: \(someCoffee.ingredients)")
someCoffee = WhipCoffee(beverage: someCoffee)
print("ingredient: \(someCoffee.ingredients)")
someCoffee = Milk(beverage: someCoffee)         // 얘가 런타임에 확장이 되기는 했지.
print("ingredient: \(someCoffee.ingredients)")
*/
