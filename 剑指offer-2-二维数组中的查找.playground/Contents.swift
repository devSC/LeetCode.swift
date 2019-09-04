import UIKit

/*
 二维数组中的查找

 题目：在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

 例如二维数组arr = [
 [1,2,3,4],
 [5,6,7,8],
 [9,10,11,12]
 ]，target=7，
 
 思路： 每次取数组的右上角的值来比较大小，如果大于目标值，则删除此行，小于目标值则删除此列。
 
 或者大于目标值则标记行index + 1， 小于目标值，则最大列的值减一
 */


//时间复杂度： O(n)
func canFind(_ target: Int, in matrix: [[Int]]) -> Bool {
    guard !matrix.isEmpty else {
        return false
    }
//    var matrix = matrix
    let firstSection = matrix.first!
    var index = 0, columnIndex = 0
    var maxIndex = firstSection.count - 1
    let maxColumnIndex = matrix.count - 1
    
    while index <= maxIndex && columnIndex <= maxColumnIndex {
        //取第一行的最后一个 item
        let rightValue = matrix[columnIndex][maxIndex]
        
        if target == rightValue {
            return true
        } else if target > rightValue {
            //删除整行
            columnIndex += 1
        } else if target < rightValue {
           maxIndex -= 1
        }
    }
    return false
}


let matrix = [
    [1,2,3,4],
    [5,6,7,8],
    [9,10,11,12]
]

canFind(9, in: matrix)
canFind(1, in: matrix)
canFind(12, in: matrix)
canFind(4, in: matrix)
canFind(19, in: matrix)
