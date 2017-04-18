//: Stack

import Foundation

class Stack {
    ///是否为空
    var isEmpty: Bool { return stack.isEmpty }
    
    ///栈的大小
    var size: Int { return stack.count }
    
    ///栈顶
    var peek: Any? {
        return stack.first
    }
    
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



		