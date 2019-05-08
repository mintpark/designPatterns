// https://github.com/ochococo/Design-Patterns-In-Swift

import UIKit
import Swift
import Foundation

/*
빌더 패턴은 복잡한 객체를 만들때 사용된다 - 특정 알고리즘을 이용하거나 같은 순서일 때.
 
 DeathStar 라는 객체를 만들고싶은데, 이걸 만들려면 좀 구구절절한 로직이 필요해.  (x,y,z)
 그래서 이 로직을 깔끔하게 재사용하고싶어.    (builder: empire)
 
 사용하는 방법은 전에 extension으로 attributedString.setColr().setFont() 했던거랑 비슷한거같아.
 차이점이라면 변경사항이 '한번에' 적용된다는 거 같다. 로직도 한눈에 보이고.
 */
final class DeathStarBuilder {
    var x: Double?
    var y: Double?
    var z: Double?
    
    typealias BuilderClosure = (DeathStarBuilder) -> ()
    
    init(buildClosure: BuilderClosure) {
        buildClosure(self)
    }
}

struct DeathStar: CustomStringConvertible {
    var description: String {
        return "Death Star at (x:\(x) y:\(y) z:\(z))"
    }
    
    let x: Double
    let y: Double
    let z: Double
    
    init?(builder: DeathStarBuilder) {
        if let x = builder.x, let y = builder.y, let z = builder.z {
            self.x = x
            self.y = y
            self.z = z
        } else {
            return nil
        }
    }
}

// 구성요소가 생성되는 순서가 다 보이네. 명시적이군.
let empire = DeathStarBuilder { builder in
    builder.x = 0.1
    builder.y = 0.2
    builder.x = 0.5 // 재선언해도 마지막것만 유효함. 멱등적인건가?!
    builder.z = 0.3
}

let empire2 = DeathStarBuilder { builder in
    builder.x = 0.5
    builder.y = 0.7
    builder.z = 0.9
}

let deathStar = DeathStar(builder: empire)
//let deathStar2 = DeathStar(builder: empire)   // 객체를 여러개 만들때의 장점은 잘 모르겠다..

empire

deathStar
//deathStar2
