// works in Swift 3

import Foundation // required for sqrt()

/**
  recursively generates an array of the prime factors of a supplied number
  
  - Parameter n: an Int being the number to be factorised
  - Parameter factorsSoFar: an array of Ints being the factors computed so far
  - Parameter i: the current Int being used as a test divisor
  
  - Returns: an array of Ints being the prime factors sorted from low to high
*/
func primeFactorise(n: Int, factorsSoFar: [Int], i: Int = 2) -> [Int] {
    
    guard n > 0 else {
        return [] // error: can only factorise natural numbers
    }
    
    guard Double(i) <= sqrt(Double(n)) else {
        return factorsSoFar + [n] // no need to check for divisors > sqrt of n, as the counterpart factor will have already been tested
    }
    
    switch n % i == 0 {
        
        case true:
        
            return primeFactorise(n: n / i, factorsSoFar: factorsSoFar + [i])
        
        case false:
        
            return primeFactorise(n: n, factorsSoFar: factorsSoFar, i: i + 1)
    }
    
    
}


/**
  recursively generates an array of the prime factors of a supplied number
  
  - Parameter _ : an Int being the number to be factorised
  
  - Returns: an array of Ints being the prime factors sorted from low to high
*/
func primeFactorise(_ n: Int) -> [Int] {
    return primeFactorise(n: n, factorsSoFar: [])
}


print(primeFactorise(1000))
