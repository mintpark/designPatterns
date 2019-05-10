import Foundation

/*
 Abstract Factory 랑 Factory Method 랑 다른거다!!!!! 으오아으앙
 아 잠시만 이거 더 못보겠어 차이점을 잘 모르겠네...
 
 클래스 생성자를 대체하는데 쓰인다. 객체 생성 과정을 추상화해서 객체를 런타임에서 인스턴스화 시킨다!
 
 feedtype 지정할때 이거 쓰면 괜찮으려나!
 */

protocol CurrencyDescribing {   // 상위 구현체
    var symbol: String { get }
    var code: String { get }
}

final class Euro: CurrencyDescribing {  // 하위 구현체 1
    var symbol: String { return "€" }
    var code: String { return "EUR" }
}

final class UnitedStateDolar: CurrencyDescribing {  // 하위 구현체 2
    var symbol: String { return "$" }
    var code: String { return "USD" }
}

enum Country {
    case unitedState
    case spain
    case uk
    case greece
}

enum CurrencyFactory {  // factory
    static func currency(for country: Country) -> CurrencyDescribing? {
        switch country {
        case .spain, .greece:
            return Euro()
        case .unitedState:
            return UnitedStateDolar()
        case .uk:
            return nil
        }
    }
}

let noCurrencyCode = "no currency code available"
//CurrencyFactory.currency(for: .greece)?.code
