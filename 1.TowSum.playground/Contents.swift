//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

let nums = [2, 7, 11, 15, 14]
let target = 26

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    for (firstIndex, firstItem) in nums.enumerated() {
        //拿到第一个, 然后从第一个开始向后拿
//        print("first item : \(firstItem), \(firstIndex)")
        for (secondIndex, secondItem) in nums.enumerated() {
            if secondIndex > firstIndex {
                print("first item : \(firstItem), \(secondItem)")
                if firstItem + secondItem == target {
                    return [firstIndex, secondIndex]
                }
            }
        }
    }
    
    return []
}


twoSum(nums, target)