import Foundation

/*:
 面试题 6: 重建二又树
 
 题目：输入某二又树的前序遍历和中序遍历的结果，请重建出该二
 
 树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。例如输
 
 入前序遍历序列{1,2,4,73548 和中序遍历序列（4,7,2,1386,
 
 則重建出图 2.6 所示的二又树并输出它的头结点。二又树结点的定义如下
 */

enum OrderError: Error {
    case invalidParams
}

class BinaryTreeNode {
    let value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(_ value: Int) {
        self.value = value
    }
    
    static func createNode(_ preOrder: [Int], inOrder: [Int]) throws -> BinaryTreeNode? {
        // 输入的合法性判断，两个数组都不能为空，并且都有数据，而且数据的数目相同
        guard !preOrder.isEmpty, !inOrder.isEmpty, preOrder.count == inOrder.count else {
            return nil
        }
        return try? createNode(preOrder, ps: 0, pe: preOrder.count - 1, inOrder: inOrder, ins: 0, ine: inOrder.count - 1)
    }
    
    /**
     *
     * @param preorder 前序遍历
     * @param ps       前序遍历的开始位置
     * @param pe       前序遍历的结束位置
     * @param inorder  中序遍历
     * @param is       中序遍历的开始位置
     * @param ie       中序遍历的结束位置
     * @return 树的根结点
     */
    //int[] preorder = {1, 2, 4, 7, 3, 5, 6, 8};
    //int[] inorder = {4, 7, 2, 1, 5, 3, 8, 6};
    static func createNode(_ preOrder: [Int], ps: Int, pe: Int, inOrder: [Int], ins: Int, ine:Int) throws -> BinaryTreeNode? {
        //开始位置大于结束位置
        if ps > pe {
            return nil
        }
        //当前根节点
        let value = preOrder[ps]
        var index = ins
        
        //在中序遍历数组中找根节点位置
        while index < ine && inOrder[index] != value {
            index += 1
        }
        
        //如果未找到，则输入参数不合法
        if index > ine {
            throw OrderError.invalidParams
        }
        
        //创建根节点
        let node = BinaryTreeNode(value)
        
        //递归构建当前根节点的左子树，左子树的元素个数： index - ins + 1个
        //eg:
        //左子树对应的前序遍历的位置在[ps + 1, ps + index - ins]
        //左子树对应的中序遍历位置在[ins, index - 1]
        node.left = try? createNode(preOrder, ps: ps + 1, pe: ps + index - ins, inOrder: inOrder, ins: ins, ine: index - 1)
        // 递归构建当前根结点的右子树，右子树的元素个数：ie-index个
        // 右子树对应的前序遍历的位置在[ps+index-is+1, pe]
        // 右子树对应的中序遍历的位置在[index+1, ie]
        node.right = try? createNode(preOrder, ps: ps + index - ins + 1, pe: pe, inOrder: inOrder, ins: index + 1, ine: ine)
        
        //返回根节点
        return node
        
    }
}




func printTree(root: BinaryTreeNode?) {
    guard root != nil else {
        return
    }
    print(root!.value)
    printTree(root: root?.left)
    printTree(root: root?.right)
}


// 普通二叉树
//              1
//           /     \
//          2       3
//         /       / \
//        4       5   6
//         \         /
//          7       8
var preorder = [1, 2, 4, 7, 3, 5, 6, 8];
var inorder = [4, 7, 2, 1, 5, 3, 8, 6];
printTree(root: try? BinaryTreeNode.createNode(preorder, inOrder: inorder))


// 所有结点都没有右子结点
//            1
//           /
//          2
//         /
//        3
//       /
//      4
//     /
//    5
print("---------")
preorder = [1, 2, 3, 4, 5];
inorder = [5, 4, 3, 2, 1];
printTree(root: try? BinaryTreeNode.createNode(preorder, inOrder: inorder))


// 完全二叉树
//              1
//           /     \
//          2       3
//         / \     / \
//        4   5   6   7
print("---------")
preorder = [1, 2, 4, 5, 3, 6, 7];
inorder = [4, 2, 5, 1, 6, 3, 7];
printTree(root: try? BinaryTreeNode.createNode(preorder, inOrder: inorder))
