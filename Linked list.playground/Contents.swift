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
        return "val: \(val), next: \(next)"
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

class LeftList {
    static func getLeftList(_ head: ListNode?, _ x: Int) -> ListNode? {
        
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

//LeftList.getLeftList(node, 3)

/*: 快行指针:
 两个指针访问链表，一个在前一个在后，或者一个移动快另一个移动慢，这就是快行指针。
*/
let node6 = ListNode(3)
node5.next = node6
node6.next = node4

class FastPointer {
    static func haveCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        while fast != nil && fast!.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                return true
            }
        }
        
        return false
    }
}

FastPointer.haveCycle(node)



