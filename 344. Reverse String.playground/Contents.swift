import UIKit

/**
 Write a function that reverses a string. The input string is given as an array of characters char[].

 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

 You may assume all the characters consist of printable ascii characters.

  

 Example 1:

 Input: ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]
 Example 2:

 Input: ["H","a","n","n","a","h"]
 Output: ["h","a","n","n","a","H"]
 
 思路：数组前后放2个指针，分别移动前后指针，做交换
 */

class Solution {
    func reverseString(_ s: inout [Character]) {
        print("result s: \(s)")
         print("result s: \(s)")
    }
}

var array: [Character] = ["h","e","l","l","o"]
Solution().reverseString(&array)
