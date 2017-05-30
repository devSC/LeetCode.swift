/*: 78. Subsets
 Given a set of distinct integers, nums, return all possible subsets.
 
 Note: The solution set must not contain duplicate subsets.
 
 For example,
 If nums = [1,2,3], a solution is:
 
 [
    [3],
    [1],
    [2],
    [1,2,3],
    [1,3],
    [2,3],
    [1,2],
    []
 ]
 
 整理后:
 [
    []
 
    [1],
 
    [2],
    [1,2],
 
    [3],
    [1,3],
    [2,3],
    [1,2,3],
 ]
 
 可以看到, 依次取出之前的值, 并且拼接上新值即可.
*/
import Foundation

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        
        guard nums.count > 0 else {
            return [[]]
        }
        
        var results: [[Int]] = [[]]
        
        for i in 0 ..< nums.count {
            let length = results.count
            for j in 0 ..< length {
                var list = results[j]
                list.append(nums[i])
                results.append(list)
                print(i, length, j,  list)
            }
        }
        return results
    }
}

Solution().subsets([1, 2, 3])
