// https://github.com/ochococo/Design-Patterns-In-Swift

import UIKit
import Swift
import Foundation

var list = [1,2,7,5,3,4,5]
var valid = 3

let aa = list.enumerated().first(where: { $0.element == valid })
aa

let bb = list.enumerated().first { (arg) -> Bool in
    let (offset, element) = arg
    return element == valid
}
bb

