import Foundation
import Swift
import UIKit

// 아니 이렇게나 public을 붙여야 하다니. 좀 놀랐다. public init()도 오늘 첨 알았네.

public protocol IntegerExpression {
    func evaluate(_ context: IntegerContext) -> Int
    func replace(character: Character, integerExpression: IntegerExpression) -> IntegerExpression
    func copied() -> IntegerExpression
}

public class IntegerContext {
    private var data: [Character: Int] = [:]
    
    public init() {}
    
    public func lookup(name: Character) -> Int {
        return self.data[name]!
    }
    
    public func assign(expression: IntegerVariableExpression, value: Int) {
        self.data[expression.name] = value
    }
}

public final class IntegerVariableExpression: IntegerExpression {
    let name: Character
    
    public init(name: Character) {
        self.name = name
    }
    
    public func evaluate(_ context: IntegerContext) -> Int {
        return context.lookup(name: self.name)
    }
    
    public func replace(character: Character, integerExpression: IntegerExpression) -> IntegerExpression {
        if name == self.name {
            return integerExpression.copied()
        } else {
            return IntegerVariableExpression(name: self.name)
        }
    }
    
    public func copied() -> IntegerExpression {
        return IntegerVariableExpression(name: self.name)
    }
}

public final class AddExpression: IntegerExpression {
    private var operand1: IntegerExpression
    private var operand2: IntegerExpression
    
    public init(op1: IntegerExpression, op2: IntegerExpression) {
        self.operand1 = op1
        self.operand2 = op2
    }
    
    public func evaluate(_ context: IntegerContext) -> Int {
        return self.operand1.evaluate(context) + self.operand2.evaluate(context)
    }
    
    public func replace(character: Character, integerExpression: IntegerExpression) -> IntegerExpression {
        return AddExpression(op1: operand1.replace(character: character, integerExpression: integerExpression),
                             op2: operand2.replace(character: character, integerExpression: integerExpression))
    }
    
    public func copied() -> IntegerExpression {
        return AddExpression(op1: self.operand1, op2: self.operand2)
    }
}

/*
 var context = IntegerContext()
 
 var a = IntegerVariableExpression(name: "A")
 var b = IntegerVariableExpression(name: "B")
 var c = IntegerVariableExpression(name: "C")
 
 var expression = AddExpression(op1: a, op2: AddExpression(op1: b, op2: c))
 
 context.assign(expression: a, value: 2)
 context.assign(expression: b, value: 1)
 context.assign(expression: c, value: 3)
 
 var result = expression.evaluate(context)
 
 */
