import Foundation

// bayes rule: odds form
// O(H | e) [odds of H given e]
// posterior (after) O(H|e) = prior O(H|e) * likelihoodFunction(H)

/* For example, we are trying to solve a mysterious murder, and start out thinking the odds of Prof. Plum vs Ms Scarlet committing the murder are 1:2 (i.e., Scarlet is twice as likely as Plum) a priori.
 
    Now we learn that the victim was killed with a lead pipe. We think that Plum, *if* he did the murder, is 60% likely to use a pipe. Scarlet, *if* she did the murder is 6% likely to use a pipe. The relative likelihood of Plum vs Scarlet using the Pipe is 10:1
 
    The posterior odds for Plum vs Scarlet are (1 : 2) * (10 : 1) = (10 : 2) = (5: 1)
*/

var priorOdds = [1.0, 2.0, 3.0]
var oddsOfUsingPipe = [0.6, 0.06, 0.5]

func posteriorOdds(priorOdds: [Double], likelihoodFunction: [Double]) -> [Double] {
    
    return zip(priorOdds,likelihoodFunction).map {$0.0 * $0.1}
}

posteriorOdds(priorOdds: priorOdds, likelihoodFunction: oddsOfUsingPipe)
