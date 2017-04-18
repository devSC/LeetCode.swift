//: 19. Remove Nth Node From End of List
/*:
 Given a linked list, remove the nth node from the end of list and return its head.
 
 For example,
 
 Given linked list: 1->2->3->4->5, and n = 2.
 
 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:
 Given n will always be valid.
 Try to do this in one pass.
*/

import Foundation


//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        return "\(val), next: \(next)"
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        
        var preNode: ListNode? = dummy
        var tailNode: ListNode? = dummy
        
        //set the tail node
        for _ in 0..<n {
            if tailNode == nil {
                break
            }
            tailNode = tailNode!.next
        }
        
        //move the two node
        while tailNode != nil && tailNode!.next != nil {
            preNode = preNode!.next
            tailNode = tailNode!.next
        }
        preNode
        //delete node
        preNode!.next = preNode!.next!.next
        
        return dummy.next
    }
}


let node = ListNode(0)
let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)

node.next = node1
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
//node5.next = node2 //please test in project
Solution().removeNthFromEnd(node, 3)
