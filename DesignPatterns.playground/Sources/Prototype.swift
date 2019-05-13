import Foundation

/*
 잉 이거도 패턴인가?
 아... 바뀔 값만 뺴고 나머지만 미리 세팅해두는건가.
 
 name을 일정하게 유지하는군. 속성을 일정하게 유지하는게 관건인건가. 게임 몹 디폴트값 유지하는 거처럼.
 초기화에 비용이 많이 드는 객체는 좀 깔끔해지겠다. back에서 benefit이 있는지는 모르겠지만.
 
 */

struct MoonWorker {
    let name: String
    var health: Int = 100
    var power: Int = 200
    
    init(name: String) {
        self.name = name
    }
    
    func clone() -> MoonWorker {
        return MoonWorker(name: name)
    }
}
/*
let prototype = MoonWorker(name: "Mint")

var m1 = MoonWorker(name: "Mint")
m1.health = 40

var m2 = prototype.clone()
m2.health = 60
m2.power = 10
*/
