// https://github.com/ochococo/Design-Patterns-In-Swift

import UIKit
import Swift
import Foundation

protocol PropertyObserver: class { // 아니 뭐 이딴... 프로토콜이지만 객체처럼 쓰겠다고?ㅋㅋㅋ 아닌데 weak 선언때매 쓰는거같은데
    func willChange(propertyName: String, newPropertyValue: Any?)
    func didChange(propertyName: String, oldPropertyValue: Any?)
}

final class TestChambers {
    weak var observer: PropertyObserver?
    
    private let testChamberNumberName = "testChamberNumber"
    
    var testChamberNumber: Int = 0 {
        willSet(newValue) {
            observer?.willChange(propertyName: testChamberNumberName, newPropertyValue: newValue)
        }
        didSet {
            observer?.didChange(propertyName: testChamberNumberName, oldPropertyValue: oldValue)
        }
    }
}

final class TestBambers {
    var observer: PropertyObserver?
    
    private let testBamberNumberName = "testBamberNumberName"
    
    var testBamberNumber: Int = 0 {         // state, storage...
        willSet(newValue) {
            observer?.willChange(propertyName: testBamberNumberName, newPropertyValue: newValue)
        }
        didSet {
            observer?.didChange(propertyName: testBamberNumberName, oldPropertyValue: oldValue)
        }
    }
    
    deinit {
        print("deinit")
    }
}

final class Observer: PropertyObserver {    // publisher
    func didChange(propertyName: String, oldPropertyValue: Any?) {
        if oldPropertyValue as? Int == 0 {
            print("Sorry about the mess. I've really let the place go since you killed me")
        }
    }
    
    func willChange(propertyName: String, newPropertyValue: Any?) {
        if newPropertyValue as? Int == 2 {
            print("okay, look. We both said a lot of things that you're going to regret")
        }
    }
}

var observerInstance = Observer()
var testChambers:TestChambers? = TestChambers(); print(CFGetRetainCount(observerInstance))
var testBambers = TestBambers(); print(CFGetRetainCount(observerInstance))

testChambers?.observer = observerInstance
testChambers?.testChamberNumber += 1; print(CFGetRetainCount(observerInstance))
print("ddd")    // observer가 weak 아닌 strong일때 여기서 retain count가 증가한다. 왜죠?
testChambers?.testChamberNumber += 1; print(CFGetRetainCount(observerInstance))

testBambers.observer = observerInstance
print("111")

testChambers?.testChamberNumber += 1; print(CFGetRetainCount(observerInstance))
testBambers.testBamberNumber += 1
testBambers.testBamberNumber += 1; print(CFGetRetainCount(observerInstance))

testChambers = nil; print(CFGetRetainCount(observerInstance))

/*
 weak var observer 선언을 해주지 않으면 observer의 retain count가 계속 증가한다.
 observer instance를 할당하고 카운트가 올라가기는 하는데 왜 그러는지는 잘 모르겠고.
 
 protocol: class를 괜히 해준게 아니었네. weak 선언을 위해 꼭 필요한 부분이었네.
 */
