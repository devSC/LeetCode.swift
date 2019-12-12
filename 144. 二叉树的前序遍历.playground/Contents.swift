import UIKit

/**
 给定一个二叉树，返回它的 前序 遍历。
 
  示例:
 
 输入: [1,null,2,3]
 1
 \
 2
 /
 3
 
 输出: [1,2,3]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-preorder-traversal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 思路：从头开始，利用栈的特性，如果 node 的 left 有值，则，将其加入 result 中，并且压入栈中，当node 的 left 为 null 时，node 指向 stack 栈顶的 right，同时对栈顶做退栈
 */



public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    //Time Complexity: O(n), Space Complexity: O(n)
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        var stack: [TreeNode] = []
        var node = root
        while !stack.isEmpty || node != nil {
            print("node: \(node)")
            if node != nil {
                res.append(node!.val)
                stack.append(node!)
                node = node!.left
            } else {
                node = stack.removeLast().right
            }
        }
        return res
    }
}
