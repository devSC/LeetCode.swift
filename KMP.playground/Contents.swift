import UIKit

//有一个文本串S，和一个模式串P，现在要查找P在S中的位置，怎么查找呢？

//思路：先找到 s 字符串最大长度收尾相同的子串。遍历查找时如果出现未匹配的情况，则只需要将匹配字符串向后移动相应（已匹配的头尾相同的）长度即可。

struct Solution {
    //s 文本串 p 模式串
    static func kmp(_ s: String, p: String) -> Int {
        let sChar: [Character] = Array(s)
        let pChar: [Character] = Array(p)
        print(sChar)
        print(pChar)
        func getNext() -> [Int] {
            var i = 0, j = -1
            
            var next: [Int] = []
            next.append(-1)

            while i < sChar.count {
                if j == -1 || sChar[i] == sChar[j] {
                    if j >= 0 {
                     print("i: \(i) j: \(j) pChar[\(i)]: \(sChar[i]) pChar[\(j)]: \(sChar[j])")
                    }
                    i += 1
                    j += 1
                    if i < next.count {
                        next[i] = j
                    } else {
                        next.append(j)
                    }
                } else {
                    j = next[j]
                }
                print("\t next: \(next)")
            }
            
            return next
        }
        
        var si = 0
        var pj = 0
        let next = getNext()
        
        while si < sChar.count && pj < pChar.count {
            if pj == -1 || sChar[si] == pChar[pj] {
                si += 1
                pj += 1
            } else {
                if pj < next.count {
                    pj = next[pj]
                } else {
                    pj = 0
                }
            }
        }
        guard pj == pChar.count else { return -1 }
        
        return si - pj
    }
}

let s = "Hello, Helloa"
let p = "lloa"
//let s = "abababca"
//let p = "abca"
Solution.kmp(s, p: p)



