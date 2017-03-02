//: Playground - noun: a place where people can play

import UIKit

/*
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8

 */

public class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public var description: String {
        return "val: \(val), next: \(next)"
    }
}

let node1 = ListNode(0)
let node2 = ListNode(7)
let node3 = ListNode(3)
node2.next = node3
node1.next = node2

let node4 = ListNode(3)
let node5 = ListNode(6)
let node6 = ListNode(0)
node5.next = node6
node4.next = node5

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        guard let l1 = l1, let l2 = l2 else {
            return nil
        }
        
        func nodeNumbers(_ node: ListNode?) -> [Int] {
            var node1Numbers = [Int]()
            var node = node
            while node != nil {
                node1Numbers.append(node!.val)
                node = node!.next
            }
            return node1Numbers
        }
        
        let node1Number = nodeNumbers(l1)
        let node2Number = nodeNumbers(l2)
        var enumNumbers = [Int]()
        var anotherNumbers = [Int]()
        
        if node1Number.count >= node2Number.count {
            enumNumbers = node1Number
            anotherNumbers = node2Number
        }
        else {
            enumNumbers = node2Number
            anotherNumbers = node1Number
        }
        
        var result: ListNode?
        var lastNode: ListNode?
        var upValue: Int = 0
        
        for (index, item) in enumNumbers.enumerated() {
            //
            var value = item + upValue
            if index < anotherNumbers.count {
                let node2Item = anotherNumbers[index]
                value = node2Item + value
            }
            
            if value >= 10 {
                upValue = 1
                value = value - 10
            }
            else {
                upValue = 0;
            }
            let node = ListNode(value)
            if (lastNode != nil) {
                lastNode!.next = node
                lastNode = node
            }
            else {
                result = node
                lastNode = node
            }
            //check is last object
            if index == enumNumbers.count - 1 && upValue > 0 {
                let node = ListNode(upValue)
                lastNode!.next = node
            }
        }
        return result
    }
}

let solution = Solution()
solution.addTwoNumbers(node6, node2)
