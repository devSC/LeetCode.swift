
import UIKit

/*
 不用加减乘除做加法

 1. 进行按位异或运算
 2. 进行按位与运算（如果有1则需要进1，所以需要进位）并向左移动
 3. 直至按位与运算为0
 */

func add(a: Int, b: Int) -> Int {
    var x = a, y = b, sum = 0, carry = 0
    repeat {
        sum = x ^ y
        carry = (x & y) << 1
        x = sum
        y = carry
    } while y != 0
    return sum
}


add(a: 2, b: 3)
add(a: 20, b: 30)
add(a: 22, b: 300)
add(a: 32, b: 43)
add(a: 32, b: -32)
add(a: 32, b: -42)

