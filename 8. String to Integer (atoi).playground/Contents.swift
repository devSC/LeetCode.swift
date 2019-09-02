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
        var stop = false
        var index = 0
        let chars: [Character] = Array(str)
        var validSymbol: Character?
        let validSymbols: [Character] = ["+", "-"]
        var symbolInt = 1
        var resultString = ""
        while stop == false && index < str.count {
            let char = chars[index]
            if char != " " {
                if validSymbols.contains(char) {
                    if validSymbol == nil {
                        validSymbol = char
                        symbolInt = char == "+" ? 1 : -1
                    } else {
                        stop = true
                    }
                } else if char >= "0" && char <= "9" {
                    resultString.append(char)
                    //check if reach max value
                    if validSymbol == nil {
                        validSymbol = "+"
                    }
                    var maxValue: Int {
                        if validSymbol == "+" {
                            return Int(Int32.max)
                        } else {
                            return Int(fabs(Double(Int32.min)))
                        }
                    }
                    if Int(resultString)! > maxValue {
                        stop = true
                        resultString = String(maxValue)
                    }
                } else {
                    stop = true
                }
            }
            else if !resultString.isEmpty || validSymbol != nil {
                stop = true
            }
            index += 1
        }
        
        guard let result = Int(resultString) else { return 0 }

        return result * symbolInt
    }
}
Solution().myAtoi("   - 321")
Solution().myAtoi("-9223372036854775809")
Solution().myAtoi("9223372036854775809")
Solution().myAtoi("2147483648")
Solution().myAtoi("+-2")
Solution().myAtoi("    123456")
Solution().myAtoi("   12a12")
Solution().myAtoi("123  123")
Solution().myAtoi("-123123")
Solution().myAtoi("     +004500")
Solution().myAtoi("words and 987")
Solution().myAtoi("0-1")
Solution().myAtoi("-13+8")
Solution().myAtoi("  +b12102370352")
