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
 
 #https://segmentfault.com/a/1190000006875558
*/

private extension String {
//    subscript (range: Range<Int>) -> String {
//        return self[self.index(self.startIndex, offsetBy: range.lowerBound)..<self.index(self.startIndex, offsetBy: range.upperBound, limitedBy: self.endIndex)!]
//    }
    /*
     Ref: http://oleb.net/blog/2014/07/swift-strings/
     "Because of the way Swift strings are stored, the String type does not support random access to its Characters via an integer index — there is no direct equivalent to NSStringʼs characterAtIndex: method. Conceptually, a String can be seen as a doubly linked list of characters rather than an array."
     
     By creating and storing a seperate array of the same sequence of characters,
     we could hopefully achieve amortized O(1) time for random access.
     */
    func randomAccessCharactersArray() -> [Character] {
        return Array(self)
    }
}

struct Solution {
    // t = O(N^2), s = O(1)
    static func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        var startIndex: Int = 0
        var maxLen: Int = 1
        var i = 0
        let charArr = s.randomAccessCharactersArray()
        while i < s.count {
//            print("s.count - i: \(s.count - i), maxLen / 2: \(maxLen / 2)")
            guard s.count - i > maxLen / 2 else {
                break
            }
            var j = i
            var k = i
            print("i: \(i), j: \(j), k: \(k)")
            //judge if string is like: aaaaa
            while k < s.count - 1 && charArr[k+1] == charArr[k] {
                print("one: \(charArr[k+1]) == \(charArr[k])")
                k += 1
            }
            i = k + 1
            print("i: \(i), j: \(j), k: \(k)")
            while k < s.count - 1 && j > 0 && charArr[k+1] == charArr[j-1] {
                print("two: \(charArr[k+1]) == \(charArr[j-1]), j:\(j)")
                k += 1
                j -= 1
            }
            print("i: \(i), j: \(j), k: \(k)")
            let newLen = k - j + 1
            print("newLen: \(newLen) \n\n")
            if newLen > maxLen {
                startIndex = j
                maxLen = newLen
            }
        }
        return String(charArr[startIndex ..< (startIndex + maxLen)])
    }
}


class Solutions {
    static func longestPalindrome(s: String) -> String {
        
        var charactersArr = Array<Character>()
        var resultString = String()
        var maxPoint = 0
        
        charactersArr.append("$")
        for character in s {
            charactersArr.append("#")
            charactersArr.append(character)
        }
        charactersArr.append("#")
        charactersArr.append("%")
        
        var rightMax = 0, middlePoint = 0
        var lenArray = Array(repeating: 1, count: charactersArr.count)
        lenArray.count
        for i in 1 ..< 2 * s.count + 2 {
            print("i: \(i)")
            if rightMax > i {
                lenArray[i] = min(rightMax - i, lenArray[2 * middlePoint - i])
            }
            
            while charactersArr[i - lenArray[i]] == charactersArr[i + lenArray[i]] {
                lenArray[i] += 1
            }
            print("lenArray: \(lenArray)")
            if lenArray[i] + i > rightMax {
                middlePoint = i
                rightMax = lenArray[i] + i
            }
            
            if lenArray[i] > lenArray[maxPoint] {
                maxPoint = i
            }
        }
        
        for i in stride(from: maxPoint - (lenArray[maxPoint] - 2), to: maxPoint + (lenArray[maxPoint] - 1), by: 2) {
            resultString.append(charactersArr[i])
        }
        
        return resultString
    }
}


Solution.longestPalindrome("babad")
Solution.longestPalindrome("aabcd")
Solution.longestPalindrome("aabaada")
Solution.longestPalindrome("aaba")
Solution.longestPalindrome("cbbd")
Solutions.longestPalindrome(s: "aabbcbbaa")
