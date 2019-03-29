import Foundation

//typealias Memento = NSDictionary

public protocol MementoConvertable {
    var memento: NSDictionary { get }
    init?(memento: NSDictionary)
}

public struct GameState: MementoConvertable {
    public var chapter: String
    public var weapon: String

    public init(chapter: String, weapon: String) {
        self.chapter = chapter
        self.weapon = weapon
    }
    
    private enum Keys {
        static let chapter = "test.valve.chapter"
        static let weapon = "test.valve.weapon"
    }
    
    public init?(memento: NSDictionary) {
        guard let chapter = memento[Keys.chapter] as? String, let weapon = memento[Keys.weapon] as? String else { return nil }
        self.chapter = chapter
        self.weapon = weapon
    }
    
    public var memento: NSDictionary {
        return [Keys.chapter: chapter, Keys.weapon: weapon]
    }
}

public struct UserState: MementoConvertable {
    public var name: String
    public var level: Int
    
    public init(name: String, level: Int) {
        self.name = name
        self.level = level
    }
    
    private enum Keys {
        static let name = "test.valve.name"
        static let level = "test.valve.level"
    }
    
    public var memento: NSDictionary {
        return [Keys.name: name, Keys.level: level]
    }
    
    public init?(memento: NSDictionary) {
        guard let name = memento[Keys.name] as? String, let level = memento[Keys.level] as? Int else { return nil }
        
        self.name = name
        self.level = level
    }
}

public enum CheckPoint {
    public static func save(_ state: MementoConvertable, saveName: String) {
        UserDefaults.standard.set(state.memento, forKey: saveName)
        UserDefaults.standard.synchronize()
    }
    
    public static func restore(saveName: String) -> NSDictionary? {
        return UserDefaults.standard.object(forKey: saveName) as? NSDictionary
    }
}

open class AAA {
    public func A1() {
        print("A1")
    }
    
    static func A2() {
        print("A2")
    }
    
//    public static A3() {
//        print("A3")
//    }
    
    class func A4() {
        print("A4")
    }
}

public struct BBB {
    static func B1() {
        print("B1")
    }
    
    public func B2() {
        print("B2")
    }
    
    public static func B3() {
        print("B3")
    }
}

/*
 var gameState = GameState(chapter: "Black Mesa", weapon: "Crownbar")
 var userState = UserState(name: "Mint", level: 1)
 
 gameState.chapter = "chap 1"
 gameState.weapon = "Glock 1"
 CheckPoint.save(gameState, saveName: "gameState1")
 userState.level = 2
 CheckPoint.save(userState, saveName: "userState1")
 
 gameState.chapter = "chap 2"
 gameState.weapon = "Glock 2"
 CheckPoint.save(gameState, saveName: "gameState2")
 userState.level = 3
 CheckPoint.save(userState, saveName: "userState2")
 
 gameState.chapter = "chap 3"
 gameState.weapon = "Glock 3"
 CheckPoint.save(gameState, saveName: "gameState3")
 userState.level = 5
 CheckPoint.save(userState, saveName: "userState3")
 
 if let memento = CheckPoint.restore(saveName: "gameState2") {
 let finalState = GameState(memento: memento)
 dump(finalState)
 }
 
 if let usermemento = CheckPoint.restore(saveName: "userState1") {
 let finalState = UserState(memento: usermemento)
 dump(finalState)
 }
 */
