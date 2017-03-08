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

//public class Solution {
//    private var int:Int = 0, lo: Int = 0, maxLen: Int = 0;
//    
//    public func longestPalindrome(s: String) -> String {
//        
//        let len = s.characters.count
//        if (len < 2) {
//            return s
//        }
//    
//        for (int i = 0; i < len-1; i++) {
//            extendPalindrome(s, i, i);  //assume odd length, try to extend Palindrome as possible
//            extendPalindrome(s, i, i+1); //assume even length.
//        }
//        
//        return s.substring(lo, lo + maxLen);
//    }
//    
//    private func extendPalindrome(s: String, j: Int, k: Int) {
//        while (j >= 0 && k < s.characters.count && s.charAt(j) == s.charAt(k)) {
//            j--;
//            k++;
//        }
//        if (maxLen < k - j - 1) {
//            lo = j + 1;
//            maxLen = k - j - 1;
//        }
//    }
//}


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
