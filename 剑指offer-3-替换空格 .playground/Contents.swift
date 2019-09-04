import UIKit

/*
 替换空格
 题目：请实现一个函数，把字符串中的每个空格替换成"%20"，例如“We are happy.”，则输出“We%20are%20happy.”。
 
 
 思路：先计算出添加空格后的数组长度，添加占位字符后，从后向前移动字符。
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

    var result: [Character] = Array(s)
    //create new place items
    result.append(contentsOf: Array<Character>(repeating: "x", count: length - result.count))
    
    var indexOfOriginal = s.count - 1
    var indexOfNew = result.count - 1
    while indexOfOriginal >= 0 && indexOfNew > indexOfOriginal {
        let char = result[indexOfOriginal]
        if char == " " {
            result[indexOfNew] = "0"
            indexOfNew -= 1
            result[indexOfNew] = "2"
            indexOfNew -= 1
            result[indexOfNew] = "%"
        } else {
            result[indexOfNew] = char
        }
        indexOfNew -= 1
        indexOfOriginal -= 1
    }
    print(String(result))
}

replaceBlank(s: "We are happy.")
