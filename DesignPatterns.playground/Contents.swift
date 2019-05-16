// https://github.com/ochococo/Design-Patterns-In-Swift

import UIKit
import Swift
import Foundation

/*
 추상부를 분리. 추상부 수정 없이, 구현부에서 코드 수정 가능.
 */

protocol Appliance {
    func run()
}

protocol Switch {
    var appliance: Appliance { get set }    // 프로토콜에 굳이 속성? 중복 줄일수는 있겠네
    func turnOn()
}

final class RemoteControl: Switch {     // 여기서 구현을 해주기는 하는데. Switch라는 프로토콜이 꼭 필요한가.
    var appliance: Appliance
    
    func turnOn() {
        appliance.run()
    }
    
    init(_ appliance: Appliance) {
        self.appliance = appliance
    }
}

final class TV: Appliance {
    func run() {
        print("TV turned on")
    }
}

final class VaccumCleaner: Appliance {
    func run() {
        print("cleaner turned on")
    }
}

let tvController = RemoteControl(TV())
tvController.turnOn()

let cleanerController = RemoteControl(VaccumCleaner())
cleanerController.turnOn()
