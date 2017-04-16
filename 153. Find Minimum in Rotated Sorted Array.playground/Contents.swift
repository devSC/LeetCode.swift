//: 153. Find Minimum in Rotated Sorted Array
/*:
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 Find the minimum element.
 
 You may assume no duplicate exists in the array.
*/

import Foundation

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        
        var left = 0, right = nums.count - 1
        //find the middle
        while left < right && nums[left] > nums[right] {
            let middle = (left + right) / 2
            if nums[middle] > nums[right] {
                left = middle + 1
            }
            else if nums[middle] < nums[right] {
                right = middle
            }
        }
        return nums[left]
    }
}

Solution().findMin([4, 5, 6, 7, 0, 1, 2])
Solution().findMin([6, 7, 8, 0, 1, 2, 3, 4, 5])