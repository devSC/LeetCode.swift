//: 452. Minimum Number of Arrows to Burst Balloons
/*:
 There are a number of spherical balloons spread in two-dimensional space. For each balloon, provided input is the start and end coordinates of the horizontal diameter. Since it's horizontal, y-coordinates don't matter and hence the x-coordinates of start and end of the diameter suffice. Start is always smaller than end. There will be at most 104 balloons.
 
 An arrow can be shot up exactly vertically from different points along the x-axis. A balloon with xstart and xend bursts by an arrow shot at x if xstart ≤ x ≤ xend. There is no limit to the number of arrows that can be shot. An arrow once shot keeps travelling up infinitely. The problem is to find the minimum number of arrows that must be shot to burst all balloons.
 
 Example:
 
 Input:
 [[10,16], [2,8], [1,6], [7,12]]
 
 Output:
 2
 
 Explanation:
 One way is to shoot one arrow for example at x = 6 (bursting the balloons [2,8] and [1,6]) and another arrow at x = 11 (bursting the other two balloons).
 
 这块总共有3种状态:
 1: A contain B
 2: A intersection B 
 3: A B ever seperate
 或者, 可以抽象成如下的数学问题：给定 n 个区间，求其一共有多少个相交的部分。
 */

import Foundation

class Solution {
    
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        
        //sort
        if points.count == 1 {
            return 1
        }
        //sort with ascending
        let sortedArray = points.sorted { (array1, array2) -> Bool in
            return array1.last! < array2.last!
        }
        
        var count = 1;
        var min = sortedArray.first!.last!
        
        for point in sortedArray {
            if point.first! >  min {
                min = point.last!
                count += 1
            }
        }
        
        return count;
    }
}

let soulution = Solution().findMinArrowShots([[10,16], [2,8], [1,6], [7,12]])
