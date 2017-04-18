//: Stack
/*: For stack:
 1. 栈是后进先出的结构。你可以理解成有好几个盘子要垒成一叠，哪个盘子最后叠上去，下次使用的时候它就最先被抽出去。
 2. 在iOS开发中，如果你要在你的App中添加撤销操作（比如删除图片，恢复删除图片），那么栈是首选数据结构
 3. 无论在面试还是写App中，只关注栈的这几个基本操作：push, pop, isEmpty, peek, size。
*/


import Foundation

class Stack {
    ///是否为空
    var isEmpty: Bool { return stack.isEmpty }
    
    ///栈的大小
    var size: Int { return stack.count }
    
    ///栈顶
    var peek: Any? { return stack.first }
    
    fileprivate var stack: [Any]
    
    init() {
        stack = [Any]()
    }
    
    
    ///加入一个新元素
    func push(_ obj: Any) {
        stack.append(obj)
    }
    
    
    ///推出栈顶元素
    func pop() -> Any? {
        if isEmpty {
            return nil
        }
        else {
            return stack.removeLast()
        }
    }
}


extension Stack: CustomStringConvertible {
    var description: String {
        return "stack: \(stack)"
    }
}

let stack = Stack()
stack.push(1)
stack.push(2)
stack.push(3)
stack
stack.pop()
stack
stack.pop()
stack
stack.pop()
stack



		