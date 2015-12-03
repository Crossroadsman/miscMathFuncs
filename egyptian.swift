/* Function to create egyptian fractions from supplied numerator(x) and denominator(y)
   this function is naive and greedy.
   Has only been tested with a few values and in all cases x < y. Probably does not work where y > x
   
   return is an array of Ints (n) where each n represents a fraction of the form 1/n
   
   E.g., 4/5 returns [2, 4, 20] which represents 1/2 + 1/4 + 1/20
 */

func egyptian(x: Int, _ y: Int) -> [Int] {
    
    var fractions: [Int] = []
    
    if (0 == x) {
        return fractions
    } else {
        
        let realDiv: Double = Double(y) / Double(x)
        var modDiv = y / x
        
        
        
        if realDiv == Double(modDiv) {
            fractions.append(modDiv)
            return fractions
        } else {
            modDiv++
            fractions.append(modDiv)
            let newX = (x * modDiv) - y
            let newY = y * modDiv
            fractions.appendContentsOf(egyptian(newX,newY))
            return fractions
            
        }
        
        
    }
    
}

/* Examples
  print(egyptian(4, 5)) // [2, 4, 20]
  print(egyptian(9, 31)) // [4, 25, 3100]
  print(egyptian(21, 50)) // [3, 12, 300]
  print(egyptian(1023, 1024)) // [2, 3, 7, 44, 9462, 373029888]
*/



