/*: 241. Different Ways to Add Parentheses
 
 Given a string of numbers and operators, return all possible results from computing all the different possible ways to group numbers and operators. The valid operators are +, - and *.
 
 
 Example 1
 Input: "2-1-1".
 
 ((2-1)-1) = 0
 (2-(1-1)) = 2
 Output: [0, 2]
 
 
 Example 2
 Input: "2*3-4*5"
 
 (2*(3-(4*5))) = -34
 ((2*3)-(4*5)) = -14
 ((2*(3-4))*5) = -10
 (2*((3-4)*5)) = -10
 (((2*3)-4)*5) = 10
 Output: [-34, -14, -10, -10, 10]
 
 Example Solution Link: [https://mp.weixin.qq.com/s?__biz=MzAwMDk1MTUyNw==&mid=2247484844&idx=1&sn=2d9d8a78ecf27258d5f7223b7b95d77a&chksm=9ae05024ad97d9324f394474e5bebaa5c13ed4bb77c6255825de62e2f7bf4cd2f1c5e585a7e4&scene=0&key=cf181e666f4b86051049995e5316b823bfd87bf556cf2fc1ac2b725baf2a493c14dcb91bf5a29c000c103f63d5b65a29b7868cb4adf08075a2f276a04a43789ea0e119f6904439ef97c8cb137bafbbaa&ascene=0&uin=MjcwMDIzODgw&devicetype=iMac+MacBookPro11%2C4+OSX+OSX+10.12.4+build(16E195)&version=12020510&nettype=WIFI&fontScale=100&pass_ticket=gmKrFuH%2Bk9YV2FG3SeEj3CQ1GZ%2F4VP8o72a3sXW9PLzGnMGzVXfTrkKeKsEu3E7j]
*/

import Foundation

class Solution {
    
    var memo = [String : [Int]]()
    let calculateChar: [Character] = ["+", "-", "*"]
    
    func diffWaysToCompute(_ input: String) -> [Int] {
        if let nums = memo[input] {
            return nums
        }
        
        var result = [Int]()
        let chars = Array(input.characters)
        
        for (i, char) in chars.enumerated() {
            guard calculateChar.contains(char) else {
                continue
            }
            let leftResults = diffWaysToCompute(String(chars[0 ..< i]))
            let rightResults = diffWaysToCompute(String(chars[i+1 ..< chars.count]))
            
            for leftRes in leftResults {
                for rightRes in rightResults {
                    if char == "+" {
                        result.append(leftRes + rightRes)
                    }
                    if char == "-" {
                        result.append(leftRes - rightRes)
                    }
                    if char == "*" {
                        result.append(leftRes * rightRes)
                    }
                }
            }
        }
        
        if result.count == 0 {
            result.append(Int(input)!)
        }
        
        memo[input] = result
        return result
    }
}

Solution().diffWaysToCompute("2*3-4*5")
