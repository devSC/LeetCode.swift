//: 71. Simplify Path
/*:
 Given an absolute path for a file (Unix-style), simplify it.
 
 For example,
 path = "/home/", => "/home"
 path = "/a/./b/../../c/", => "/c"
 
 注: 
 1. . 代表当前路径。比如 /a/. 实际上就是 /a，无论输入多少个 . 都返回当前目录
 2. ..代表上一级目录。比如 /a/b/.. 实际上就是 /a，也就是说先进入a目录，再进入其下的b目录，再返回b目录的上一层，也就是a目录。
*/
import Foundation

class Solution {
    func simplifyPath(_ path: String) -> String {
        //use stack
        var stack = [String]()
        
        let paths = path.components(separatedBy: "/")
        
        //push stack or pop stack
        for path in paths {
            guard path.isEmpty == false else {
                continue
            }
            
            //ignore .
            guard path != "." else {
                continue
            }
            
            if path == ".." {
                if stack.isEmpty == false {
                    stack.removeLast()
                }
            }
            else {
                stack.append(path)
            }
        }
        //new path
        let destination = stack.reduce("") { $0 + "/" + $1 }
        return destination.isEmpty ? "/" : destination
    }
}

Solution().simplifyPath("/a/./b/../../c/")
Solution().simplifyPath("/home/")
Solution().simplifyPath("/home/ss/.")
Solution().simplifyPath("")
