//: 5. Longest Palindromic Substring
import Foundation

/*:
Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

Example:

Input: "babad"

Output: "bab"

Note: "aba" is also a valid answer.
Example:

Input: "cbbd"

Output: "bb"
 
*/

class Solution {
    func longestPalindrome(_ s: String) -> String {
        
        guard s.characters.count >= 2 else {
            return s
        }
        
        var maxLength: Int = 0
        var location: Int = 0
        let characters = s.characters
        
        for (index, char) in characters.enumerated() {
            
            print("char: \(char), index: \(index)")
            let charStartIndex = characters.index(of: char)!
            
            if index + 1 < characters.count {
                let charEndIndex = characters.index(charStartIndex, offsetBy: 1)
                let nextChar = characters[charEndIndex]
                //
                print("nextChar: \(nextChar)")
            }

//            let nextCharIndex = index + 1
//            if nextCharIndex < characters.count {
//                let nextChar = characters[nextCharIndex]
//                
//            }
        }
        
        return s
    }
}

let solution = Solution()

solution.longestPalindrome("babad")
