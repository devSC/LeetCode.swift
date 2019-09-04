import UIKit

/*
 替换空格
 题目：请实现一个函数，把字符串中的每个空格替换成"%20"，例如“We are happy.”，则输出“We%20are%20happy.”。
 
 
 思路：先计算出添加空格后的数组长度，然后再赋值
 */


//时间复杂度： O（n） 空间复杂度 O(n)
func replaceBlank(s: String) {
    
    var length = 0
    for char in s {
        if char == " " {
            length += 3
        } else {
            length += 1
        }
    }
    var result: [Character] = Array(repeating: "x", count: length)
    var index = 0
    for char in s {
        if char == " " {
            result[index] = "%"
            index += 1
            result[index] = "2"
            index += 1
            result[index] = "0"
        } else {
            result[index] = char
        }
        index += 1
    }
    print(String(result))
}

replaceBlank(s: "We are happy.  ")
