import Foundation

public final class MoneyPile {
    let value: Int
    let quantity: Int
    var nextPile: MoneyPile?
    
    public init(value: Int, quantity: Int, nextPile: MoneyPile?) {
        self.value = value
        self.quantity = quantity
        self.nextPile = nextPile
    }
    
    func canWithdraw(amount: Int) -> Bool {
        var amount = amount
        var quantity = self.quantity
        
        func canTakeSomeBill(want: Int) -> Bool {
            return (want/self.value) > 0
        }
        
        while canTakeSomeBill(want: amount) {
            if quantity == 0 { break }
            
            amount -= self.value
            quantity -= 1
        }
        
        guard amount > 0 else { return true }
        
        if let next = self.nextPile {
            return next.canWithdraw(amount: amount)
        }
        
        return false
    }
}

public final class ATM {
    private var hundred: MoneyPile
    private var fifty: MoneyPile
    private var twenty: MoneyPile
    private var ten: MoneyPile
    
    private var startPile: MoneyPile {
        return self.hundred
    }
    
    public init(hundred: MoneyPile, fifty: MoneyPile, twenty: MoneyPile, ten: MoneyPile) {
        self.hundred = hundred
        self.fifty = fifty
        self.twenty = twenty
        self.ten = ten
    }
    
    public func canWithdraw(amount: Int) -> String {
        return "Can withdraw \(self.startPile.canWithdraw(amount: amount))"
    }
}

/* test code 
let ten = MoneyPile(value: 10, quantity: 6, nextPile: nil)          // 10 x 6
let twenty = MoneyPile(value: 20, quantity: 2, nextPile: ten)       // 20 x 2
let fifty = MoneyPile(value: 50, quantity: 2, nextPile: twenty)     // 50 x 2
let hundred = MoneyPile(value: 100, quantity: 1, nextPile: fifty)   // 100 x 1

var atm = ATM(hundred: hundred, fifty: fifty, twenty: twenty, ten: ten)
atm.canWithdraw(amount: 310)
atm.canWithdraw(amount: 100)
atm.canWithdraw(amount: 165)
*/
