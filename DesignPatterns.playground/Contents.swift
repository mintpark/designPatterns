// https://github.com/ochococo/Design-Patterns-In-Swift

import UIKit
import Swift
import Foundation

/*
 incompatible한 두 객체를 어댑티로 감싸서 연결시켜버림. 
 */

protocol NewDeathStarSuperLaserAiming { // 얘는 왜 굳이 쓰는거지? 프로토콜 쓸 이유가 특별히 없는거같다.
    var angleV: Double { get }
    var angleH: Double { get }
}

struct OldDeathStarSuperlaserTarget {   // adaptee 1
    let angleHorizontal: Float
    let angleVertical: Float
    
    init(angleHorizontal: Float, angleVertical: Float) {
        self.angleHorizontal = angleHorizontal
        self.angleVertical = angleVertical
    }
}

struct OldDeathStarSuperlaserTarget2 { // adaptee 2
    let pritttt: Float
    
    init(prit: Float) {
        self.pritttt = prit
    }
}

struct NewDeathStarSuperlaserTarget: NewDeathStarSuperLaserAiming { // adapter
    private var target: OldDeathStarSuperlaserTarget
    private var target2: OldDeathStarSuperlaserTarget2
    
    var angleV: Double {
        return Double(target.angleVertical + target2.pritttt)
    }
    
    var angleH: Double {
        return Double(target.angleHorizontal)
    }
    
    init(_ target: OldDeathStarSuperlaserTarget, target2: OldDeathStarSuperlaserTarget2) {
        self.target = target
        self.target2 = target2
    }
}

let target = OldDeathStarSuperlaserTarget(angleHorizontal: 14, angleVertical: 12)
let target2 = OldDeathStarSuperlaserTarget2(prit: 24)
// target을 바꿔버리겠다아아
let newFormat = NewDeathStarSuperlaserTarget(target, target2: target2)

newFormat.angleV
newFormat.angleH
