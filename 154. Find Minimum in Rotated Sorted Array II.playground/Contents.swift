//: 154. Find Minimum in Rotated Sorted Array
/*
 Follow up for "Find Minimum in Rotated Sorted Array":
 What if duplicates are allowed?
 
 Would this affect the run-time complexity? How and why?
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
 
 Find the minimum element.
 
 The array may contain duplicates.
*/

import Foundation

//暴力枚举法
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        
        if nums.count == 0 {
            return 0
        }
        
        var minValue = nums[0]
        
        for item in nums {
            minValue = min(minValue, item)
        }
        
        return minValue
    }
}

Solution().findMin([4, 5, 6, 7, 0, 1, 2])
Solution().findMin([3,1,1])
Solution().findMin([3,1,3])

//二分法
class Solution1 {
    func findMin(_ nums: [Int]) -> Int {
        
        var left = 0, right = nums.count - 1
        
        while left < right {
            let mid = (left + right) / 2
            if nums[mid] > nums[right] {
                left = mid + 1
            }
            else if nums[mid] < nums[right] {
                right = mid
            }
            else {
                right -= 1
            }
        }
        return nums[left]
    }
}

Solution1().findMin([3,1,3])
Solution1().findMin([4, 5, 6, 7, 0, 1, 2])
Solution1().findMin([3,1,1])
