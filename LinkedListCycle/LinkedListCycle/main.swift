//
//  main.swift
//  LinkedListCycle
//
//  Created by Wilson-Yuan on 2019/11/7.
//  Copyright © 2019 Wilson-Yuan. All rights reserved.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        return "\(val), next: \(next)"
    }
}

let node = ListNode(1)
let node1 = ListNode(5)
let node2 = ListNode(3)
let node3 = ListNode(2)
let node4 = ListNode(4)
let node5 = ListNode(2)

node.next = node1
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node2 //please test in project

class Solution {
    static func haveCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        while fast != nil && fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                return true
            }
        }
        
        return false
    }
}

print("haveCycle: \(Solution.haveCycle(node))")

