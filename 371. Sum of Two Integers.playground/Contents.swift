/*:
 371. Sum of Two Integers

 Calculate the sum of two integers a and b, but you are not allowed to use the operator + and -.
 
 Example:
 Given a = 1 and b = 2, return 3.

*/

import Foundation

class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        guard b != 0 else {
            return a
        }
        var sum: Int = 0
        var carry: Int = 0
        sum = a^b
        carry = (a & b) << 1
        return getSum(sum, carry)
    }
}

Solution().getSum(2, 1)
