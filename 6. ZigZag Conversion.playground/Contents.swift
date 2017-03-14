//: 6. ZigZag Conversion

/*:
The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R
And then read line by line: "PAHNAPLSIIGYIR"
Write the code that will take a string and make this conversion given a number of rows:

string convert(string text, int nRows);
convert("PAYPALISHIRING", 3) should return "PAHNAPLSIIGYIR".
*/
import Foundation

class Solution {
    static func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }
        
        let charArr: [Character] = Array(s.characters)
        var exchars: [Int: String] = [:]
        
        for i in 0..<numRows {
            exchars[i] = ""
        }
        exchars
        
        var index = 0, incre = 1
        for i in 0..<charArr.count {
//            print("i: \(i), index: \(index)")
            exchars[index]!.append(charArr[i])
            if index == 0 {
                incre = 1
            }
            if index == numRows - 1 {
//                print("**i: \(i), index: \(index)")
                incre = -1
            }
            index += incre
        }
        var str: String = ""
        for i in 0 ..< exchars.keys.count {
            str += exchars[i]!
        }
        return str
    }
}

Solution.convert("PAYPALISHIRING", 3)