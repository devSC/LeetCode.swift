//: 8. String to Integer (atoi)
/*:
 Implement atoi to convert a string to an integer.
 
 Hint: Carefully consider all possible input cases. If you want a challenge, please do not see below and ask yourself what are the possible input cases.
 
 Notes: It is intended for this problem to be specified vaguely (ie, no given input specs). You are responsible to gather all the input requirements up front.
 
 Update (2015-02-10):
 The signature of the C++ function had been updated. If you still see your function signature accepts a const char * argument, please click the reload button  to reset your code definition.
 
 规则: 跳过前面的空格字符，直到遇上数字或正负号才开始做转换，而再遇到非数字或字符串时（'\0'）才结束转化，并将结果返回（返回转换后的整型数）。

*/

import Foundation

class Solution {
    func myAtoi(_ str: String) -> Int {
        
        guard !str.isEmpty else {
            return 0
        }
        
        let chars: [Character] = Array(str.characters)
        
        //1.trim the prefix
        var validChar: Character?
        var symbolInt = 1
        var validSymbol: [Character] = ["+", "-"]
        var index = 0

        while validChar == nil && index < chars.count {
            let char = chars[index]
            ///is + or - symbol
            if validSymbol.contains(char) {
                validChar = char
                if char == "-" {
                    symbolInt = -1
                }
            }
            else if char != " " {
                validChar = char
            }
            else {
                index += 1
            }
        }
        
        let validChars = Array(chars[index..<chars.count])
        
        //2.find valid char
        index = 0
        var stop: Bool = false
        var numberString: String = ""
        
        var max_value = Int(Int32.max)
        if symbolInt < 0 {
            max_value = Int(fabs(Double(Int32.min)))
        }
        
        while stop == false && index < validChars.count {
            let char = validChars[index]
            if char >= "0" && char <= "9" {
                //check number
                numberString.append(char)
                
                if Int(numberString)! > max_value {
                    numberString = String(max_value)
                    stop = true
                }
            }
            else if !(validSymbol.contains(char) && index == 0) {
                stop = true
            }
            index += 1
        }
        
        //3. return valid number
        guard let number = Int64(numberString) else {
            return 0
        }
        
        //4. append symbol
        var result = number * Int64(symbolInt)
        return Int(result)
    }
}
Solution().myAtoi("-9223372036854775809")
Solution().myAtoi("9223372036854775809")
Solution().myAtoi("2147483648")
Solution().myAtoi("+-2")
Solution().myAtoi("    123456")
Solution().myAtoi("   12a12")
Solution().myAtoi("123  123")
Solution().myAtoi("-123123")
