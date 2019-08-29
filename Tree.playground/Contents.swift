//: Tree
/*:
 二叉树中每个节点最多有两个子节点，一般称为左子节点和右子节点，并且二叉树的子树有左右之分，其次序不能任意颠倒。
*/
import Foundation


///Tree node
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

extension TreeNode: CustomStringConvertible {
    var description: String {
        return "\(val), left: \(left), right: \(right)"
    }
}


///Max tree depth
class MaxTreeDepth {
    func maxTreeDepath(root: TreeNode?) -> Int {
        guard let tree = root else {
            return 0
        }
        return max(maxTreeDepath(root:tree.left), maxTreeDepath(root: tree.right)) + 1
    }
}


/*:
 给你一棵二叉树，怎么判断它是二叉查找树？
 
 注: 二叉查找树，是一种特殊的二叉树。它的特点就是左子树中节点的值都小于根节点的值，右子树中节点的值都大于根节点的值。
 
 注意:
 1. 二叉树本身是由递归定义的，所以原理上所有二叉树的题目都可以用递归来解
 2. 二叉树这类题目很容易就会牵涉到往左往右走，所以写helper函数要想到有两个相对应的参数
 3. 记得处理节点为nil的情况，尤其要注意根节点为nil的情况
*/
class BST {
    func isValidBST(root: TreeNode?) -> Bool {
        return helper(node: root, nil, nil)
    }
    
    private func helper(node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        
        guard let node = node else {
            return true
        }
        
        //all right node must > root
        if let min = min, node.val <= min {
            return false
        }
        
        //all left node must < root
        if let max = max, node.val >= max {
            return false
        }
        
        return helper(node: node.left, min, node.val) && helper(node: node.right, node.val, max)
    }
}

class TreeEnumeration {
    
    ///用栈实现前序便利
    func preorderTraversal(root: TreeNode?) -> [Int] {
        
        var results = [Int]()
        var stack = [TreeNode]()
        var node = root
        
        while !stack.isEmpty || node != nil {
            //print("stack: \(stack),\n\tnode: \(node)")
            if node != nil {
                results.append(node!.val)
                stack.append(node!)
                node = node!.left
            }
            else {
                node = stack.removeLast().right
            }
        }
        
        return results
    }
}

///level enumeration //层级遍历
class LevelOrdr {
    func enumeration(root: TreeNode?) -> [[Int]] {
        
        guard let root = root else {
            return [[Int]]()
        }
        
        var result = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)
        
        while queue.isEmpty == false {
            
            var level = [Int]()
            let size = queue.count
            
            //enumeration same level node
            for _ in 0 ..< size {
                
                let node = queue.removeFirst()
                level.append(node.val)
                
                //next level
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            result.append(level)
        }
        
        return result
    }
}

let bstTree = TreeNode(2)

let bstLeft = TreeNode(1)
let bstRight = TreeNode(3)
bstLeft.left = TreeNode(4)
bstRight.right = TreeNode(5)

bstTree.left = bstLeft
bstTree.right = bstRight

BST().isValidBST(root: bstTree)

TreeEnumeration().preorderTraversal(root: bstTree)

LevelOrdr().enumeration(root: bstTree)
