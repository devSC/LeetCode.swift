//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

let nums = [2, 7, 11, 15, 14]
let target = 29

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var map = [Int : Int]()
    for (index, item) in nums.enumerated() {
        if let mapIndex = map.index(forKey: target - item) {
            return [map[mapIndex].value, index]
        }
        else {
            map[item] = index
        }
    }
    return []
}

twoSum(nums, target)
