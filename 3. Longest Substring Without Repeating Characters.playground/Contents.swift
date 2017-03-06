//: Longest Substring Without Repeating Characters

import UIKit

/*
Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
*/

func lengthOfLongestSubstring(_ s: String) -> Int {
    
    var maxLength = 0
    /// last no repeating char index
    var pre = 0
    /// current location
    var loc = 0
    var positionCharMap: [Character : Int] = [:]
    
    for c in s.characters {
        if let preloc = positionCharMap[c] {
            pre = preloc + 1 > pre ? preloc + 1 : pre
        }
        positionCharMap[c] = loc
        maxLength = loc - pre + 1 > maxLength ? loc - pre + 1 : maxLength
        loc += 1
    }
    
    return maxLength
}

lengthOfLongestSubstring("abcabcbb")
lengthOfLongestSubstring("bbbbb")
lengthOfLongestSubstring("pwwkew")