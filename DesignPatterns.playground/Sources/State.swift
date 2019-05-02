import Foundation

/*
 internal state의 변화를 즉시 추적할 수 있다구. 프로토콜로 state들을 묶어놓으니 가능하지.
 프로토콜이 분명 인터페이스랑 다른거일텐데. 진짜 비슷하게 동작하네.
 
 pop protocol VS oop interface
 프로토콜이 좀더 pop스럽기는 하다.
 */
final class Context {
    private var state: State = UnauthorizedState()
    
    var isAuthrized: Bool {
        get { return state.isAuthorized(context: self) }
    }
    
    var userId: String? {
        get { return state.userId(context: self) }
    }
    
    func changeStateToAuthorized(userId: String) {
        state = AuthorizedState(userId: userId)
    }
    
    func changeStateToUnauthorized() {
        state = UnauthorizedState()
    }
}

protocol State {
    func isAuthorized(context: Context) -> Bool
    func userId(context: Context) -> String?
}

class UnauthorizedState: State {
    func isAuthorized(context: Context) -> Bool {
        return false
    }
    
    func userId(context: Context) -> String? {
        return nil
    }
}

class AuthorizedState: State {
    let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func isAuthorized(context: Context) -> Bool {
        return true
    }
    
    func userId(context: Context) -> String? {
        return userId
    }
}
/*
let userContext = Context()
(userContext.isAuthrized, userContext.userId)
userContext.changeStateToAuthorized(userId: "admin")
(userContext.isAuthrized, userContext.userId)
userContext.changeStateToUnauthorized()
(userContext.isAuthrized, userContext.userId)
*/
