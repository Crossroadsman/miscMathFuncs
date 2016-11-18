import Foundation

extension Double {
    func squared() -> Double {
        return self * self
    }
    
    func factorial() -> Double {
        if self <= 1 {
            return self
        }
        return self * (self - 1).factorial()
    }

}

extension Int {
    func factorial() -> Int {
        return (1 ... self).reduce(1) {$0 * $1}
    }
}

/**
 WARNING: because this uses factorial(), it becomes computationally infeasible very quickly.
 
 n is the number of items
 r is the number chosen
 */
func binomialCoefficient(n: Double, r: Double) -> Double {
    let nf = n.factorial()
    let rf = r.factorial()
    let nsrf = (n - r).factorial()
    return nf / (rf * nsrf)
}

binomialCoefficient(n: 16, r: 3)
binomialCoefficient(n: 3, r: 4).squared()
