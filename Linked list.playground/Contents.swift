//: Playground - noun: a place where people can play
/*:
 给一个链表和一个值x，要求只保留链表中所有小于x的值，原链表的节点顺序不能变。
 例：1->5->3->2->4->2，给定x = 3。则我们要返回 1->2->2
*/
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

class Solution {
    static func removeNode(_ head: ListNode?, at x: Int) -> ListNode? {
        
        let dummy = ListNode(0)
        var pre = dummy
        
        let tailDummp = ListNode(0)
        var tail = tailDummp
        
        var node = head
        
        while node != nil {
            if node!.val < x {
                pre.next = node
                pre = node!
            }
            else {
                tail.next = node
                tail = node!
            }
            node = node!.next
        }
        
        //join
        tail.next = nil
        pre.next = tailDummp.next
        
        return dummy.next
    }
}

Solution.removeNode(node, at: 3)



