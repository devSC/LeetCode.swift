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
        func isValidNumberChar(_ char: Character?) -> Bool {
            guard let char = char else {
                return false
            }
            return (char >= "0" && char <= "9")
        }
        
        func isValidSymbol(_ char: Character?) -> Bool {
            guard let char = char else {
                return false
            }
            let validSymbols: [Character] = ["+", "-"]
            return validSymbols.contains(char)
        }
        
        let trimedString = str.trimmingCharacters(in: CharacterSet.whitespaces)
        guard !trimedString.isEmpty else {
            return 0
        }
        var numberString: String = ""
        
        let chars: [Character] = Array(trimedString)
        let firstChar = chars.first!
        let symbolInt: Int
        //检车首字母是否为有效
        
        if isValidSymbol(firstChar) {
            symbolInt = firstChar == "+" ? 1 : -1
        } else if isValidNumberChar(firstChar) {
            symbolInt = 1
            numberString.append(firstChar)
        } else {
            return 0
        }
        
        var index = 1
        var stop = false
        
        while !stop && index < chars.count  {
            let char = chars[index]
            if isValidNumberChar(char) {
                numberString.append(char)
                
                let value = Int(numberString)! * symbolInt
                if value >= 0 {
                    if value > Int32.max {
                        numberString = String(Int32.max)
                        stop = true
                    }
                } else {
                    if value < Int32.min {
                        numberString = String(Int(fabs(Double(Int32.min))))
                        stop = true
                    }
                }
            } else {
                stop = true
            }
            index += 1
        }
        
        guard let result = Int(numberString) else {
            return 0
        }
        
        return symbolInt * result
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
