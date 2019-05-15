import Foundation

/*
 싱글톤은 너무 많이 사용하면 안된다!
 전역에 걸쳐 하나의 객체만 사용하고 있다.
 */

final class ElonMusk {
    static let shared = ElonMusk()
    
    private init() {
        // 아무데서나 생성하지 못하도록 반드시 private으로 초기화해야한다!!!
    }
    
    func amIElon() -> Bool {
        return true
    }
}
/*
let elon = ElonMusk.shared
elon.amIElon()

let elon2 = ElonMusk.shared
elon2.amIElon()
*/
