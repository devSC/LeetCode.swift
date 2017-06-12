//: 155. Min Stack
/*:
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 
 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
 
 Example:
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> Returns -3.
 minStack.pop();
 minStack.top();      --> Returns 0.
 minStack.getMin();   --> Returns -2.
*/

import Foundation

class MinStack {
    fileprivate var stack: [Int] = []
    
    private var min: Int? = Int.max
    private var minStack: [Int] = []
    
    init() {
        self.minStack.append(self.min!)
    }
    
    func push(x: Int) {
        if let min = min, x < min {
            self.min = x
            minStack.append(x)
        }
        stack.append(x)
    }
    
    func pop() {
        let last = stack.removeLast()
        if last == min {
            //refresh the min value
            minStack.removeLast()
            min = minStack.last
        }
        
    }
    
    func top() -> Int? {
        return stack.first
    }
    
    func getMin() -> Int? {
        return min
    }
}

extension MinStack: CustomStringConvertible {
    var description: String {
        return stack.description
    }
}

let stack = MinStack()
stack.push(x: 2)
stack.push(x: 3)
stack.push(x: 1)
stack.push(x: 0)
stack.pop()

stack.top()
stack.getMin()


