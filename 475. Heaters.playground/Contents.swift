//: 475: Heaters

/*:
Winter is coming! Your first job during the contest is to design a standard heater with fixed warm radius to warm all the houses.

Now, you are given positions of houses and heaters on a horizontal line, find out minimum radius of heaters so that all houses could be covered by those heaters.

So, your input will be the positions of houses and heaters seperately, and your expected output will be the minimum radius standard of heaters.
 

Note:
 
Numbers of houses and heaters you are given are non-negative and will not exceed 25000.
 
Positions of houses and heaters you are given are non-negative and will not exceed 10^9.
 
As long as a house is in the heaters' warm radius range, it can be warmed.
 
All the heaters follow your radius standard and the warm radius will the same.
 
 
 
Example 1:
 
Input: [1,2,3],[2]
 
Output: 1
 
Explanation: The only heater was placed in the position 2, and if we use the radius 1 standard, then all the houses can be warmed.
 
 
Example 2:
 
Input: [1,2,3,4],[1,4]
 
Output: 1
 
Explanation: The two heater was placed in the position 1 and 4. We need to use radius 1 standard, then all the houses can be warmed

*/

import Foundation

class Solution {
    static func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        
        func removeDepulicate(houses: [Int], heaters: [Int]) -> [Int] {
            var info: [Int: Int] = [:]
            for position in houses {
                info[position] = 1
            }
            
            for position in heaters {
                info[position] = 1
            }
            
            let arrays = info.keys.sorted() {$0 < $1}
            return arrays
        }
        
        let allPosition = removeDepulicate(houses: houses, heaters: heaters)
        //index of hearts, 
        var heaterIndexsAtHouses = [Int]()
        for position in heaters {
            guard let index = allPosition.index(of: position) else {
                continue
            }
            heaterIndexsAtHouses.append(index)
        }
        
        //calculate max len to edge
        var maxLen: Int = 0
        if heaterIndexsAtHouses.count == 1 {
            let index = heaterIndexsAtHouses.first!
            let position = allPosition[index]
            let toStart = ceil(Double(position - houses.first!))
            let toEnd = ceil(Double((houses.last!) - position));
            maxLen = max(Int(toStart), Int(toEnd))
        }
        else {
            //middle index
            for (position, index) in heaterIndexsAtHouses.enumerated() {
                
                guard index + 1 < heaterIndexsAtHouses.count else {
                    break
                }
                
                let nextPosition = heaterIndexsAtHouses[index + 1]
                let inter = nextPosition - position - 1
                let interRadius = Int(ceil(Double(inter) / 2.0))
                if maxLen < interRadius {
                    maxLen = interRadius
                }
            }
            
            let toStart = heaterIndexsAtHouses.first!
            let toEnd = (houses.last!) - heaterIndexsAtHouses.last! - 1;
            let maxValue = max(toStart, toEnd)
            maxLen = max(maxLen, maxValue)
        }
        return maxLen
    }
}

//Solution.findRadius([1, 2, 3, 4, 5, 6], [1, 3]) //3
//Solution.findRadius([2, 4, 5, 6], [1, 3]) //3
//Solution.findRadius([1, 2, 10], [2, 9]) //7
Solution.findRadius([1,2,3,5,15], [2,30]) //13
