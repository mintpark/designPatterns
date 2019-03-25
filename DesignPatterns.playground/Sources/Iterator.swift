public struct Novella {
    let name: String
    
    public init(name: String) {
        self.name = name
    }
}

public struct Novellas {
    let novellas: [Novella]
    
    public init(novellas: [Novella]) {
        self.novellas = novellas
    }
}

public struct NovellasIterator: IteratorProtocol {
    private var current = 0
    private let novellas: [Novella]
    
    init(novellas: [Novella]) {
        self.novellas = novellas
    }
    
    public mutating func next() -> Novella? {
        defer { current += 1 }
        return novellas.count > current ? novellas[current] : nil
    }
}

extension Novellas: Sequence {
    public func makeIterator() -> NovellasIterator {
        return NovellasIterator(novellas: novellas)
    }
}

/*
 
 let greateNovellas = Novellas(novellas: [Novella(name: "The Mist"), Novella(name: "Croco")])
 
 for novella in greateNovellas {
 print("I've read: \(novella)")
 }

 */
