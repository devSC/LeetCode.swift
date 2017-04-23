//: 98. Validate Binary Search Tree
/*:
 Given a binary tree, determine if it is a valid binary search tree (BST).
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 Example 1:
   2
  / \
 1   3
 Binary tree [2,1,3], return true.
 Example 2:
   1
  / \
 2   3
 Binary tree [1,2,3], return false.
*/

import Foundation

/**
 * Definition for a binary tree node.
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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(node: root, max: nil, min: nil)
    }
    
    private func helper(node: TreeNode?, max: Int?, min: Int?) -> Bool {
        guard let node = node else {
            return true
        }
        if let min = min, node.val <= min {
            return false
        }
        
        if let max = max, node.val >= max {
            return false
        }
        return helper(node: node.left, max: node.val, min: min) && helper(node: node.right, max: max, min: node.val)
    }
}

let node = TreeNode(6)
let left = TreeNode(4)
left.left = TreeNode(3)
left.right = TreeNode(5)

node.left = left
node.right = TreeNode(7)
Solution().isValidBST(node)

/*
 Print:
 max: nil, val: 6, min: nil
 max: Optional(6), val: 4, min: nil
 max: Optional(4), val: 3, min: nil
 max: Optional(6), val: 5, min: Optional(4)
 max: nil, val: 7, min: Optional(6)
 */
