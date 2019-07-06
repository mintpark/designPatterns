// https://github.com/ochococo/Design-Patterns-In-Swift

import UIKit
import Swift
import Foundation

/*
 
 Flyweight
 자원에 대한 비용이 클 때(중복 생성될 가능성 높거나, 비용은 큰데 사용빈도는 낮은) 비용을 아끼기 위해.
 
 */

struct SpecialityCoffee {
    let origin: String
}

protocol CoffeeSearching {
    func search(origin: String) -> SpecialityCoffee?
}

final class Menu: CoffeeSearching {
    private var coffeeAvailable: [String: SpecialityCoffee] = [:]   // search 쓰려고 dict 쓴건가
    
    func search(origin: String) -> SpecialityCoffee? {  // 중복생성을 방지. 이미 생성된게 있으면 그걸 쓴다.
        if coffeeAvailable.index(forKey: origin) == nil {
            coffeeAvailable[origin] = SpecialityCoffee(origin: origin)  // 사용할 때 생성. 찾아보고 없으면 생성하니까.
        }
        
        return coffeeAvailable[origin]
    }
}

final class CoffeeShop {
    private var orders: [Int: SpecialityCoffee] = [:]
    private let menu: CoffeeSearching
    
    init(menu: CoffeeSearching) {
        self.menu = menu
    }
    
    func takeOrder(origin: String, table: Int) {
        orders[table] = menu.search(origin: origin)
    }
    
    func serve() {
        for (table, origin) in orders {
            print("serving \(origin) to table \(table)")
        }
    }
}

let coffeeShop = CoffeeShop(menu: Menu())

coffeeShop.takeOrder(origin: "Yirgacheff, Ethiopia", table: 1)
coffeeShop.takeOrder(origin: "Buziraguhindwa, Brundi", table: 2)
coffeeShop.takeOrder(origin: "Yirgacheff, Ethiopia", table: 1)

coffeeShop.serve()
