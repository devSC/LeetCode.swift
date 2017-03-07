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
findMedianSortedArrays(nums1, nums2)

nums1 = [1, 3]
nums2 = [2]
findMedianSortedArrays(nums1, nums2)

nums1 = []
nums2 = [3]
findMedianSortedArrays(nums1, nums2)

nums1 = [1, 1]
nums2 = [1, 3]
findMedianSortedArrays(nums1, nums2)

