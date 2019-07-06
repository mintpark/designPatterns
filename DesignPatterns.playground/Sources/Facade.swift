import Foundation

/*
 subscript를 쓰는게 핵심인듯.
 sub를 선언해두면 객체에서 직접 인덱스로 값을 설정하고 검색함. 따로 메소르를 빼낼 필요 없음.
 */

final class Defaults {
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    subscript(key: String) -> String? {
        get {
            return defaults.string(forKey: key)
        }
        set {
            defaults.set(newValue, forKey: key)
        }
    }
}

/*
// facade
let storage = Defaults()
storage["Bishop"] = "I'm so innocent"
storage["Bishop"]       // 아름다워! 깔끔해!

// no facade
let userDefault = UserDefaults()
userDefault.set("I'm dark night", forKey: "Knight")
userDefault.string(forKey: "Knight")
*/
