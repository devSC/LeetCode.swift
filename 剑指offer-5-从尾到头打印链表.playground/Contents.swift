import Foundation

/*
 面试题 5: 从尾到头打印链表
 
 题目：输入一个链表的头结点，从尾到头反过来打印出每个结点的值
 
 思路： 利用栈，或者数组倒序输出
 
 时间复杂度：O(n) 空间复杂度：O(n)
 */

class ListNode {
    let key: Int
    var next: ListNode?
    
    init(_ key: Int) {
        self.key = key
        self.next = nil
    }
}

func printAll(_ node: ListNode) {
    var nodes: [ListNode] = []
    //add to nodes
    var next: ListNode? = node
    while next != nil {
        nodes.append(next!)
        next = next?.next
    }
    //reverse
    var index = nodes.count - 1
    while index >= 0 {
        print("value: \(nodes[index].key)")
        index -= 1
    }
}

let node = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
let node6 = ListNode(6)

node.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6

printAll(node)


