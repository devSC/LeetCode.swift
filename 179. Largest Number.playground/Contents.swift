//: 179. Largest Number
/*:
 Given a list of non negative integers, arrange them such that they form the largest number.
 
 For example, given [3, 30, 34, 5, 9], the largest formed number is 9534330.
 
 Note: The result may be very large, so you need to return a string instead of an integer.
 
*/

import Foundation

class Solution {
    
    func largestNumber(_ numbers: [Int]) -> String {    
        //1.0 map to str array and sort the array
        let array = numbers.map { String($0) }.sorted { (str1, str2) -> Bool in
            let prefixChar1 = Array(str1.characters).first!
            let prefixChar2 = Array(str2.characters).first!
            
            if prefixChar1 == prefixChar2 {
                return Int(str1)! > Int(str2)!
            }
            return prefixChar1 > prefixChar2
        }
        //2.0 get the result
        let result = array.reduce("") { (result, string) -> String in
            return result.appending(string)
        }
        return result
    }
}

Solution().largestNumber([3, 30, 34, 5, 9])
