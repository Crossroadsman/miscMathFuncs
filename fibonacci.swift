func fib(n: Int) -> Int {
    
    let d = Double(n)
    let phi = (1 + sqrt(5.0)) / 2 // assuming phi not in library
  
    /*
        p^d - (1 - p)^d
        ---------------
            sqrt(5)
    
    */
    return Int((pow(phi, d) - pow((1 - phi), d)) / (sqrt(5.0)))
    
    
}
