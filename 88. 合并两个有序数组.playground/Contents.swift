import UIKit

/**
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。

 说明:

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大 于或等于 m + n）来保存 nums2 中的元素。
 示例:

 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 输出: [1,2,2,3,5,6]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

        //倒序插入
        var p = m - 1 //m
        var q = n - 1 //n
        var index = m + n - 1
        
        while p >= 0 && q >= 0 {
            //分别取最后一个，如果谁大，则放入 nums1 的最后一个
            if nums1[p] < nums2[q] {
                nums1[index] = nums2[q]
                q -= 1
            } else {
                nums1[index] = nums1[p]
                p -= 1
            }
            index -= 1
        }
        
        //如果 q 任然 大于等于0
        while q >= 0 {
            //继续插入
            nums1[index] = nums2[q]
            index -= 1
            q -= 1
        }
    }

    
    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var result: [Int] = []
        var p = 0 //m
        var q = 0 //n
        
        while (p < m) && (q < n) {
            let pValue = nums1[p]
            let qValue = nums2[q]
            if pValue <= qValue {
                result.append(pValue)
                p += 1
            } else {
                result.append(qValue)
                q += 1
            }
        }
        //p 已经遍历完最后一个, 但 q 任有值未遍历
        if q < n  {
            nums2[q ..< n]
            result.append(contentsOf: nums2[q ..< n])
        }
        //q 已经到最后，但 P 任有值未遍历
        if p < m  {
            result.append(contentsOf: nums1[p ..< m])
        }
        nums1 = result
    }
}


var arr = [1,2,3, 0, 0, 0]
Solution().merge(&arr, 3, [2,5,6], 3)
print("arr: \(arr)")
