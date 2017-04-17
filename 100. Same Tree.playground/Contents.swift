//: 100. Same Tree
/*:
 Given two binary trees, write a function to check if they are equal or not.
 
 Two binary trees are considered equal if they are structurally identical and the nodes have the same value.
*/

import Foundation


//Definition for a binary tree node.
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        if (p == nil && q == nil) {
            return true
        }
        
        if (p == nil || q == nil) || (p!.val != q!.val) {
            return false
        }
        
        return isSameTree(p!.left, q!.left) && isSameTree(p!.right, q!.right)
    }
}

let p = TreeNode(0)
let p1 = TreeNode(1)
let p2 = TreeNode(2)
p.left = p1
p.right = p2

let q = TreeNode(0)
let q1 = TreeNode(1)
let q2 = TreeNode(2)
q.left = q1
q.right = q2


Solution().isSameTree(p, q)
