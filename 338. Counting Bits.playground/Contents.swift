/*: 338. Counting Bits

 Given a non negative integer number num. For every numbers i in the range 0 ≤ i ≤ num calculate the number of 1's in their binary representation and return them as an array.
 
 Example:
 For num = 5 you should return [0,1,1,2,1,2].
 
 Follow up:
 
 It is very easy to come up with a solution with run time O(n*sizeof(integer)). But can you do it in linear time O(n) /possibly in a single pass?
 Space complexity should be O(n).
 Can you do it like a boss? Do it without using any builtin function like __builtin_popcount in c++ or in any other language.
 
 SOLUTION: https://mp.weixin.qq.com/s?__biz=MzAwMDk1MTUyNw==&mid=2247484822&idx=1&sn=ec293aec713cc7ca0f956faad83a86be&chksm=9ae0501ead97d90801cdf3f1e5ca0d81b8c7ce8d9331677b2f4d2c50a715954b60603d467c9a&mpshare=1&scene=1&srcid=0508Yuy3567kdRmazbfkJiHu&key=3fa25093d92ebc15b96c136f4ae8cdb45ceb44aadafdd666c52ebc3fa028984e940dc32b0140eb36c0daa0ee83dec662d8e5bca4ed3a70d589b0ba94cd7ee40e1320f6a479185f868e0d74ea6071fa77&ascene=0&uin=MjcwMDIzODgw&devicetype=iMac+MacBookPro11%2C4+OSX+OSX+10.12.4+build(16E195)&version=12020510&nettype=WIFI&fontScale=100&pass_ticket=D5aqihYhOAOTFqLrcSN1Eun2c4E3HkwKwXbv5mqrDPLyU50UVdEs8Gh%2FcOmwK44H
*/
import Foundation

class Solution {
    func countBits(_ num: Int) -> [Int] {
        
        guard num > 0 else {
            return [0]
        }
        
        var dp:[Int] = Array(repeating: 0, count: num + 1)
        
        for i in 1...num {
            if i % 2 == 0 {
                dp[i] = dp[i / 2]
            }
            else {
                dp[i] = dp[i / 2] + 1
            }
        }
        return dp
    }
}

Solution().countBits(3)
