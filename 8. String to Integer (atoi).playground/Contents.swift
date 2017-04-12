//: 8. String to Integer (atoi)
/*:
 Implement atoi to convert a string to an integer.
 
 Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.
 
 Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.
 
 Update (2015-02-10):
 The signature of the C++ function had been updated. If you still see your function signature accepts a const char * argument, please click the reload button  to reset your code definition.
*/

import Foundation
//http://bookshadow.com/weblog/2016/01/22/leetcode-string-to-integer-atoi/
//class Solution {
//    func myAtoi(_ str: String) -> Int {
//        return 0
//    }
//}

class Solution {
    func myAtoi(_ str: String) -> Int {
        var res = 0
        var flag = 1
        var index = 0
        let int_max = 2147483647
        let int_min = -2147483648
        
        // trim
        let content = [Character](str.characters)
        while index < content.count {
            guard content[index] == " " else {
                break
            }
            index += 1
        }
        guard index < content.count else {
            return res
        }
        
        // handle flag
        if content[index] == "-" {
            flag = -1
            index += 1
        } else if content[index] == "+" {
            index += 1
        }
        
        while index < content.count {
            guard _isDigit(content[index]) else {
                break
            }
            
            res = res * 10 + Int(String(content[index]))!
            
            if res >= int_max {
                if flag == 1 {
                    return int_max
                } else if res > int_max && flag == -1 {
                    return int_min
                }
            }
            
            index += 1
        }
        
        return flag * res
    }
    
    private func _isDigit(_ char: Character) -> Bool {
        return char >= "0" && char <= "9"
    }
}

Solution().myAtoi("w31s1g2s8g9q9e2r")
