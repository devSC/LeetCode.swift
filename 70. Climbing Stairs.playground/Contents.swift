//: 70. Climbing Stairs
/*:
 You are climbing a stair case. It takes n steps to reach to the top.
 
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 Note: Given n will be a positive integer.
 
*/

import Foundation

///default solution
class Solution {
    
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        return climbStairs(n - 1) + climbStairs(n - 2)
    }
}

///Improve solution
class Solution2 {
    
    var cache = [Int: Int]()
    
    func climbStairs(_ n: Int) -> Int {
        cache[0] = 1
        cache[1] = 1
        
        return helper(n)
    }
    
    
    private func helper(_ n: Int) -> Int {
        
        ///get the value from cache
        if let n = cache[n] {
            return n
        }
        
        cache[n] = helper(n - 1) + helper(n - 2)
        
        return cache[n]!
    }
}


///roll array, enumer from bottom
class Solution3 {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        }
        
        var num1 = 1
        var num2 = 2

        var result = 0
        
        for i in 2 ..< n {
            result = num1 + num2
            num1 = num2
            num2 = result
        }
        
        return result
    }
}
