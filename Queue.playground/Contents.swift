//: Queue
/*: For queue:
 1. 队列是先进先出的结构。
 2. iOS开发中多线程的GCD和NSOperationQueue就是基于队列实现的。
 3. 关于队列我们只关注这几个操作：enqueue, dequeue, isEmpty, peek, size。
*/

import Foundation

class Queue {
    
    ///是否为空
    var isEmpty: Bool { return queue.isEmpty }
    
    ///队列大小
    var size: Int { return queue.count }
    
    ///队列首元素
    var peek: Any? { return queue.first }
    
    fileprivate var queue: [Any]
    
    
    init() {
        queue = [Any]()
    }
    
    
    ///加入新元素
    func enqueue(_ obj: Any) {
        queue.append(obj)
    }
    
    
    ///推出队列元素
    func dequeue() -> Any? {
        if isEmpty {
            return nil
        }
        else {
            return queue.removeFirst()
        }
    }

}
