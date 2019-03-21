import Foundation

protocol DoorCommand {
    func execute() -> String
}

class OpenCommand: DoorCommand {
    let door: String
    
    required init(door: String) {   // required 안붙여도 되기는 된당
        self.door = door
    }
    
    func execute() -> String {
        return "open/ \(door)"
    }
}

class CloseCommand: DoorCommand {
    let door: String
    
    required init(door: String) {
        self.door = door
    }
    
    func execute() -> String {
        return "close/ \(door)"
    }
}

public class HAL9000DoorsOperations {
    private let openCommand: OpenCommand
    private let closeCommand: CloseCommand
    
    public init(doors: String) {
        openCommand = OpenCommand(door: doors)
        closeCommand = CloseCommand(door: doors)
    }
    
    public required init() {
        openCommand = OpenCommand(door: "temp")
        closeCommand = CloseCommand(door: "temp2")
    }
    
    public func open() -> String {
        return openCommand.execute()
    }
    
    public func close() -> String {
        return closeCommand.execute()
    }
}

/*
 let ddDoors = "dd Doors"
 
 let aaa = HAL9000DoorsOperations()
 aaa.close()
 
 let doorModule = HAL9000DoorsOperations(doors: "Pod Bay Doors")
 doorModule.close()
 
 let aaModule = HAL9000DoorsOperations(doors: "aa Doors")
 aaModule.open()
 aaModule.close()
 
 doorModule.open()
 

 */
