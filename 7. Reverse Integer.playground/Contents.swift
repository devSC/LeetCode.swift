//: 7. Reverse Integer
/*:
Reverse digits of an integer.

Example1: x = 123, return 321
Example2: x = -123, return -321
*/

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        
        //change to string
        var chars: [Character] = Array(String(x).characters)
        guard chars.count > 0 else { return x }
        
        //1: check have + or -
        var operatorStr = ""
        if chars.first! == "-" || chars.first! == "+" {
            operatorStr = String(chars.first!)
            chars.remove(at: 0)
        }
        //2: reverse
        chars.reverse()
        let result = chars.reduce(operatorStr) { (result, char) -> String in
            return result + String(char)
        }
        guard let intResult = Int32(result) else {
            return 0
        }
        return Int(intResult)
    }
}

Solution().reverse(-123)
