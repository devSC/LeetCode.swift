import UIKit

/**
 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。

 案例:

 s = "leetcode"
 返回 0.

 s = "loveleetcode",
 返回 2.
  

 注意事项：您可以假定该字符串只包含小写字母。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/first-unique-character-in-a-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let charArr: [Character] = Array(s)
        var character = Array(repeating: 0, count: 256)
        //遍历数组
        for char in charArr {
            let index = Int(char.asciiValue!)
            character[index] = character[index] + 1
        }
        //找到 index 为 1的数
        for (index, char) in charArr.enumerated() {
            let charIndex = Int(char.asciiValue!)
            if character[charIndex] == 1 {
                return index
            }
        }
        return -1
    }
}

Solution().firstUniqChar("leetcode")
Solution().firstUniqChar("loveleetcode")
