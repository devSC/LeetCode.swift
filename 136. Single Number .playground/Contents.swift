import Foundation
/*:
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 
 Note:
 
 Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example 1:
 
 Input: [2,2,1]
 Output: 1
 Example 2:
 
 Input: [4,1,2,1,2]
 Output: 4
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return -1
        }
        var result: Int = nums.first!
        var index = 1
        while index < nums.count {
            result = result ^ nums[index]
            index += 1
        }
        return result
    }
}

Solution().singleNumber([4,1,2,1,2])
Solution().singleNumber([14,21,22,21,22])
Solution().singleNumber([64,64,2,1,2])
Solution().singleNumber([44,44,2,21,2])
Solution().singleNumber([41,41,2,1,2])
