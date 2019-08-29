import UIKit

/**
 234. Palindrome Linked List
 Easy

 1882

 271

 Favorite

 Share
 Given a singly linked list, determine if it is a palindrome.

 Example 1:

 Input: 1->2
 Output: false
 Example 2:

 Input: 1->2->2->1
 Output: true
 Follow up:
 Could you do it in O(n) time and O(1) space?
 */

/**
 思路：使用快慢2个指正找到链表中点，慢指针每次前进一步，快指针每次前进2步。在慢指针前进过程中，同时修改 next 指针，使得链表前半部分反序，
 最后比较中点两侧的链表是否相等。
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil && head?.next != nil else {
            return true
        }
        var prev: ListNode?
        var slow = head
        var fast = head
        //12321
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next //1
            let next = slow?.next //3
            slow?.next = prev // 1
            prev = slow //2
            slow = next //3
            print("0-prev: \(String(describing: prev?.val)) slow: \(String(describing: slow?.val)) fast: \(String(describing: fast?.val))")
        }
        print("1-prev: \(String(describing: prev?.val)) slow: \(String(describing: slow?.val)) fast: \(String(describing: fast?.val))")
        if fast != nil {
            slow = slow?.next
        }
        print("2-prev: \(String(describing: prev?.val)) slow: \(String(describing: slow?.val)) fast: \(String(describing: fast?.val))")
        while slow != nil {
            if slow?.val != prev?.val {
                return false
            }
            slow = slow?.next
            prev = prev?.next
            print("3-prev: \(String(describing: prev?.val)) slow: \(String(describing: slow?.val)) fast: \(String(describing: fast?.val))")
        }
        return true
    }
}


let node = ListNode(1)
let node1 = ListNode(2)
let node2 = ListNode(3)
let node3 = ListNode(3)
let node4 = ListNode(2)
let node5 = ListNode(1)

node.next = node1
node1.next = node2
node2.next = node4
//node3.next = node4
node4.next = node5


Solution().isPalindrome(node)
