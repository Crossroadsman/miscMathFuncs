import Foundation


enum Constants {
    static let 𝜏 = Double.pi * 2
    static let earthRadiusPoles: Double = 6356.752 //km
    static let earthRadiusEquator: Double = 6378.137
    static let earthRadiusAverage: Double = 6371.001 // km
    static let earthEquatorialCircumference: Double = 40_075 // km
}

let circumferenceE = Constants.𝜏 * Constants.earthRadiusEquator
let circumferenceP = Constants.𝜏 * Constants.earthRadiusPoles
circumferenceE/circumferenceP // max variance is 0.3%

let circumferenceA = Constants.𝜏 * Constants.earthRadiusAverage
circumferenceE/circumferenceA
circumferenceA/circumferenceP

/**
 Decimal version of cos()
 */
func cosd(_ degrees: Double) -> Double {
    return cos(degrees * Constants.𝜏 / 360.0)
}
/**
 
 **Important**: This simplified algorithm assumes a spherical earth. The earth is actually closer to an oblate spheroid (see: https://en.wikipedia.org/wiki/Figure_of_the_Earth ). Accordingly, the use of average radius in this model can create up to ~0.22% error. Therefore, **this model should only be used for making general observations about the earth and not for any purpose where greater accuracy is required.**
 
    The equatorial circumference of the Earth is approx. 40,075km, therefore every degree of longitude is 40,075 / 360 == 109.79km (5SF)
 
    To calculate the circumference for a given latitude, consider the following:
 
 ```
            P
            |
         , ---- ,
     , '    |    ' ,
   -,-------x-------,--R
   ,        |   , /   ,
  ,         | /       ,
 -,---------O----------,--E
  ,         |         ,
   ,        |        ,
    ,       |        ,
     ,      |      ,'
      '-, __|__ ,-'
            |
 ```
 where:
 
 - P is the Polar axis
 - E is the Equatorial latitude
 - R is the lat to be determined
 - X is the origin of the circle described by the line of latitude
 
 Observe that angle ORX is the same as EOR, i.e., the angle of latitude
 Observe also that the line OR == OE, i.e., the radius of the earth
 
 We can compute the radius at the given lat using cosine: (adjacent / hypotenuse) == cos (angle)
 
 Thus:
 
 ```
 XR
 --  == cos(ORX)
 OE
 ```
 which can be rearranged to:
 
 ```
 XR == OE cos (ORX)
 ```
 
 since we want circumference and circumference is tau * radius
 
 circumference at lat = tau * OE cos(ORX)
 
 */
class LatitudeCalculator {
    
    private func radiusFor(latitude: Double) -> Double {
        
        // lat radius
        // ----------------- == cos(latAngle)
        // equatorial radius
        
        // lat radius == (eq.radius) * cos(latAngle)
        
        return Constants.earthRadiusAverage * cosd(latitude)
        
    }
    
    func circumferenceFor(latitude: Double) -> Double {
        let radius = radiusFor(latitude: latitude)
        return radius * Constants.𝜏
    }
    
    func lengthOfADegreeAt(latitude: Double) -> Double {
        return circumferenceFor(latitude: latitude) / 360.0
    }
    
    
}

// Illustration:

let latitudeCalculator = LatitudeCalculator()

print(latitudeCalculator.circumferenceFor(latitude: 51.05))

print(latitudeCalculator.lengthOfADegreeAt(latitude: 51.05))

print(latitudeCalculator.lengthOfADegreeAt(latitude: 0))
