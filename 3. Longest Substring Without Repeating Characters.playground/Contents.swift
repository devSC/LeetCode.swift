//: Longest Substring Without Repeating Characters

import UIKit

/*
Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 思路：标记上一个未重复的字段的位置，等遇到重复字段时，更新最长长度
*/

func lengthOfLongestSubstring(_ s: String) -> Int {
    
    var maxLength = 0
    // last no repeating char index
    var pre = 0
    // current location
    var loc = 0
    //字符和上一次出现的位置
    var positionCharMap: [Character : Int] = [:]
    
    for char in s {
        if let preloc = positionCharMap[char] {
            //如果当前的下一个位置比之前的未重复字符位置靠后，则更新
            pre = preloc + 1 > pre ? preloc + 1 : pre
        }
        positionCharMap[char] = loc
        maxLength = loc - pre + 1 > maxLength ? loc - pre + 1 : maxLength
        loc += 1
    }
    return maxLength
}

lengthOfLongestSubstring("abcabcbb")
lengthOfLongestSubstring("bbbbb")
lengthOfLongestSubstring("pwwkew")
lengthOfLongestSubstring("abccabcbb")
