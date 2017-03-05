import Foundation

//convenience extensions on Int
extension Int {
    
    func sqrt() -> Int {
        let d = Double(self)
        let r = Foundation.sqrt(d)
        return Int(r)
    }
    
    func squared() -> Int {
        return self * self
    }
    
}

/**
Sieve of Eratosthenes
/*
func sieve(to n: Int) -> [Int] {
    
    switch n {
    case _ where n < 2:
        return []
    case 2:
        //return [false, false, true]
        return [2]
    case 3:
        return [2, 3]
        //return [false, false, true, true]
    default:
        var primes = [Bool](repeatElement(true, count: n + 1))
        primes[0] = false
        primes[1] = false

        for i in 2 ... n.sqrt() {
            
            if primes[i] {
                
                for j in stride(from: i.squared(), through: n, by: i) {
                    
                    primes[j] = false
                    
                }
                
            }
            
        }
        var output = [Int]()
        for (key, value) in primes.enumerated() {
            if value { output.append(key) }
        }
        return output
    }
    
}
