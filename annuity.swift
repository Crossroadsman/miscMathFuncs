import Foundation

struct Annuity {
    
    /**
     The factor to be applied to the per-period payment to compute the present value of the annuity.
     
     ```
     E.g., a 10 year annuity at 5% per annum interest has a factor of 7.72173...
     If the per-period payment were $100, that would imply a total present value of $772
     ```
     
     Based on annuity-immediate (i.e., guaranteed annuity with payments made at the end of periods but interest is accrued during period.
     - Parameter interestRate: a decimal representation of a percentage rate (*where the rate is per period*). E.g., 4.5% would be entered as 0.045
     - Parameter numberOfPeriods: The number of periods (where a period is the same duration as the interest rate parameter)
    */
    func presentValueFactor (interestRate rate: Double, numberOfPeriods periods: Int) -> Double {
        
        let dPeriods = Double(periods)
        
        let pv = (1 - pow((1.0 + rate), (dPeriods * -1))) / rate
        return pv
    }
    
    /**
     Typically, the annuity formula is used in circumstances where the interest rate is expressed as an annual rate but the payments are made monthly.
     
     - SeeAlso: `presentValueFactor()`
     
     */
    func presentValueFactorWithMonthlyPayments (annualInterestRate rate: Double, numberOfMonths periods: Int) -> Double {
        
        return presentValueFactor(interestRate: (rate / 12), numberOfPeriods: periods)
        
    }
    
    
    func presentValue(perPeriodPayment payment: Double, pvFactor factor: Double) -> Double {
        return payment * factor
    }
    
    func payment(totalPresentValue pv: Double, pvFactor factor: Double) -> Double {
        return pv / factor
    }
    
    /**
     All-in-one function to compute the present value of annuity with specified periodic payments, interest rate and periods
     */
    func presentValueOfAnnuityWith(payment: Double, periodicInterestRate rate: Double, paymentPeriods periods: Int) -> Double {
        
        return presentValue(perPeriodPayment: payment, pvFactor: presentValueFactor(interestRate: rate, numberOfPeriods: periods))
        
    }
    
    /**
     All-in-one function to compute the present value of annuity with specified monthly payments, annualised interest rate and months
     */
    func presentValueOfMonthlyAnnuityWith(monthlyPayment payment: Double, annualInterestRate rate: Double, paymentMonths periods: Int) -> Double {
        
        return presentValue(perPeriodPayment: payment, pvFactor: presentValueFactorWithMonthlyPayments(annualInterestRate: rate, numberOfMonths: periods))
        
    }
    
    /**
     All-in-one function to compute the regular periodic payment of an annuity with a given present value and specified periodic interest rate and number of periods.
     */
    func periodicPaymentOfAnnuityWith(pv: Double, rate: Double, periods: Int) -> Double {
        
        return payment(totalPresentValue: pv, pvFactor: presentValueFactor(interestRate: rate, numberOfPeriods: periods))
        
    }
    
    /**
     All-in-one function to compute the regular monthly payment of an annuity with a given present value and specified annualised interest rate and number of months.
     */
    func monthlyPaymentOfAnnuityWith(pv: Double, rate: Double, months: Int) -> Double {
        
        return payment(totalPresentValue: pv, pvFactor: presentValueFactor(interestRate: rate, numberOfPeriods: months))
        
    }
    
    
}

// Examples
// --------
let myLoan = Annuity()
print(myLoan.presentValueFactor(interestRate: 0.05, numberOfPeriods: 10))

print(myLoan.presentValue(perPeriodPayment: 100, pvFactor: 7.72))

print(myLoan.payment(totalPresentValue: 772, pvFactor: 7.72))

print(myLoan.presentValue(perPeriodPayment: 100, pvFactor: myLoan.presentValueFactorWithMonthlyPayments(annualInterestRate: 0.12, numberOfMonths: 60)))

print(
    myLoan.presentValueOfAnnuityWith(payment: 10_000, periodicInterestRate: 0.05, paymentPeriods: 5)
)

print(
    myLoan.presentValueOfMonthlyAnnuityWith(monthlyPayment: 750, annualInterestRate: 0.05, paymentMonths: 60)
)

print(
    myLoan.periodicPaymentOfAnnuityWith(pv: 50_000, rate: 0.075, periods: 5)
)

print(
    myLoan.monthlyPaymentOfAnnuityWith(pv: 50_000, rate: 0.075, months: 60)
)
