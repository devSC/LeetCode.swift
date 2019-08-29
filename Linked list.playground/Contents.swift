/*:
 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。

 你应当保留两个分区中每个节点的初始相对位置。

 示例:

 输入: head = 1->4->3->2->5->2, x = 3
 输出: 1->2->2->4->3->5

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/partition-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation

class ListNode {
    let value: Int
    var next: ListNode?
    
    init(_ value: Int) {
        self.value = value
        self.next = nil
    }
}

extension ListNode: CustomStringConvertible {
    var description: String {
        return "\(value), next: \(String(describing: next))"
    }
}

class Solution {
    static func removeNode(_ node: ListNode?, at x: Int) -> ListNode? {
        let header = ListNode(0)
        var pre = header

        let tailNode = ListNode(0)
        var tail = tailNode
        
        var varNode = node
        while varNode != nil {
            if varNode!.value < x {
                pre.next = varNode
                pre = varNode!
                print(pre)
            } else {
                tail.next = varNode
                tail = varNode!
            }
            varNode = varNode?.next
        }
        //remove last next node of tail
        tail.next = nil
        
        pre.next = tailNode.next
        return header.next
    }
    
    static func printAllValue(_ node: ListNode) {
        var node: ListNode? = node
        while node != nil {
            print("value: \(String(describing: node?.value))")
            node = node?.next
        }
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
node

Solution.removeNode(node, at: 3)

Solution.printAllValue(node)
