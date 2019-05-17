// https://github.com/ochococo/Design-Patterns-In-Swift

import UIKit
import Swift
import Foundation

/*
 클라이언트에서 복합객체와 단일객체를 구별없이 다룰수 있게 해주는 패턴.
 전체-부분의 관계를 갖는 객체를, 동일한 인터페이스로 사용할 수 있음
 어... 이거 혹시....article & band...? File & Directory !!!
 */

// component
protocol Shape {
    func draw(fillColor: String)
}

// leaf
final class Square: Shape {
    func draw(fillColor: String) {
        print("draw square with \(fillColor)")
    }
}

final class Circle: Shape {
    func draw(fillColor: String) {
        print("draw circle with \(fillColor)")
    }
}

// composite 복합객체
final class Whiteboard: Shape {
    private lazy var shapes = [Shape]()
    
    init(_ shapes: Shape...) {
        self.shapes = shapes
    }
    
    func draw(fillColor: String) {
        for shape in self.shapes {
            shape.draw(fillColor: fillColor + " on whiteboard")
        }
    }
}

var whiteboard = Whiteboard(Circle(), Square()) // 여기가 add하고 갖고있는거구나.
var whiteboard2 = Whiteboard(Circle(), Circle())
var whiteboard3 = Whiteboard(Square(), Square())

var wall = Whiteboard(Circle(), Circle(), Square(), whiteboard, whiteboard2, whiteboard3)
wall.draw(fillColor: "blue")
