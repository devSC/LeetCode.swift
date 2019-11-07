import UIKit

/**
 反转一个单链表。
 
 示例:
 
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        //定义遍历指针
        var p: ListNode? = head
        //定义新头
        var newH: ListNode?
        while p != nil {
            //记录下一个节点
            let temp = p?.next
            //将之前的节点放到新链表的后面
            p?.next = newH
            //新节点为头节点
            newH = p
            //移动 P 指针
            p = temp
        }
        //返回反转后的链表头结点
        return newH
    }
}

let header = ListNode(0)
let item1 = ListNode(1)
let item2 = ListNode(2)
let item3 = ListNode(3)
let item4 = ListNode(4)
header.next = item1
item1.next = item2
item2.next = item3
item3.next = item4
let result = Solution().reverseList(header)

var p = result
while p != nil {
    print("p?.val: \(p!.val)")
    p = p?.next
}
