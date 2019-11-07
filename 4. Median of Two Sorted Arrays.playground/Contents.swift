//: 4. Median of Two Sorted Arrays
import Foundation
/*:
 #QUESTION:
 
There are two sorted arrays nums1 and nums2 of size m and n respectively.

Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).

Example 1:
nums1 = [1, 3]
nums2 = [2]

The median is 2.0
Example 2:
nums1 = [1, 2]
nums2 = [3, 4]

The median is (2 + 3)/2 = 2.5
*/


func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    var nums: [Int] = []
    nums.append(contentsOf: nums1)
    nums.append(contentsOf: nums2)
    
    var values = nums.sorted { (first, second) -> Bool in
        return first < second
    }
    
    if values.count == 0 {
        return 0
    }
    else if values.count % 2 == 0 {
        //even number
        let cIdx = Double(values.count / 2)
        //is last object eg: [0, 1]
        if Int(cIdx) == values.count - 1 {
            return Double(values.reduce(0) { $0 + $1 }) / 2.0
        }
        else {
            let median = values[Int(cIdx)] + values[Int(cIdx - 1)]
            return Double(median) / 2.0
        }
    }
    else {
        //odd number
        let cIdx = Double(values.count / 2)
        return Double(values[Int(cIdx)])
    }
}

var nums1: [Int] = [1, 2]
var nums2: [Int] = [3, 4]
//findMedianSortedArrays(nums1, nums2)

nums1 = [1, 3]
nums2 = [2]
findMedianSortedArrays(nums1, nums2)
//
//nums1 = []
//nums2 = [3]
//findMedianSortedArrays(nums1, nums2)
//
//nums1 = [1, 1]
//nums2 = [1, 3]
//findMedianSortedArrays(nums1, nums2)

//查找无序数组中位数
func findMedian(_ nums: inout [Int]) -> Int {
    let low = 0
    let high = nums.count - 1
    let mid = high / 2
    var div = partSort(&nums, start: low, end: high)
    
    while div != mid {
        print("mid: \(mid) div: \(div) nums: \(nums)")
        if mid < div {
            //在左半区查找
            div = partSort(&nums, start: low, end: div - 1)
            
        } else {
            //y在右半区查找
            div = partSort(&nums, start: div + 1, end: high)
        }
        print("mid: \(mid) div: \(div) nums: \(nums) ---")
    }
    return nums[mid]
}

func partSort(_ nums: inout [Int], start: Int, end: Int) -> Int {
    
    let pivot = nums[start]
    var left = start
    var right = end
    //5
    while left < right {
        //从右往左找，找到第一个比当前 pivot 值小的
        while left < right && nums[right] > pivot {
            right -= 1
        }
        if left < right {
            nums[left] = nums[right]
        }
        //从左往右找，找到第一个比 pivot 值大的
        while left < right && nums[left] < pivot {
            left += 1
        }
        
        if left < right {
            nums[right] = nums[left];
        } else {
            //到达中间
            nums[left] = pivot
        }
    }
    
    //返回中位 index
    return left;
}

//6, 1, 2, 5, 4, 3
var array = [12, 3, 10, 8, 6, 7, 11, 13, 9, 2]
//3 6 7 8 9 10 11 12 13
//        |
//2 3 6 7 8 9 10 11 12 13

//partSort(&array, start: 0, end: array.count - 1)

findMedian(&array)


