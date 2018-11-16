import UIKit

//在swift中，enum，struct，class都是面向对象的数据类型，具有面向对象的特征，本节用来介绍枚举类型
//虽然是面向对象的数据类型，但是枚举的实例化不叫做对象，只有类的实例化才叫做对象

//声明一个枚举变量
enum Weekdays {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
}
//也可以这么声明，在一行里面
enum Weekdays2 {
    case Monday, Tuesday, Wednesday, Thursday, Friday
}
//枚举变量的使用
var day = Weekdays.Monday   //这是常规的赋值方法
day = .Thursday                   //这是简略的赋值方法，只有编译器能根据上下文推断出该类型是枚举时才可以使用，因为day已经确定为枚举类型了
print(day)
//在switch中使用枚举类型是可以不需要default的，其他的类型都是必须！！提供switch！！
//case必须包含enum中的所有内容，这也就是为什么不需要default，因为所有的情况都包含进去了
//
//有时候也需要为枚举类型提供原始值，可以是字符串，整数，浮点数等等
enum Weekdays3: Int {
    case Monday = 0
    case Tuesday = 1
    case Wednesday = 2
    case Thursday = 3
    case Friday = 4
}
//也可以这么写
enum Weekdays4: Int {
    case Monday = 0, Tuesday, Wednesday, Thursday, Friday   //后面的值会在前面的基础上加一
}
let friday = Weekdays3.Friday.rawValue
print(friday)
let thursday = Weekdays3(rawValue: 3)    //这个地方赋值的话，值的类型是可选值，所以需要在下面强制解包
print(thursday!)
//
//enum中还可以定义联合类型
//比如
enum Figure {
    case Rectangle(Int, Int)
    case Circle(Int)
}
//枚举Figure有两个相关值，对于一个Figure实例只能是其中之一
func printFigure(figure: Figure) {
    switch figure {
    case .Rectangle(let width, let height):
        print("矩形的宽:\(width),矩形的高:\(height)")
    case .Circle(let radius):
        print("圆形的半径:\(radius)")
    }
}

var figure = Figure.Rectangle(1024, 768)
printFigure(figure: figure)
figure = .Circle(666)
printFigure(figure: figure)
//
//上面的switch还能这么写
func printFigure2(figure: Figure) {
    switch figure {
    case let .Rectangle( width, height):    //使用let或者var的目的是为了从相关值中提取数据
        print("矩形的宽:\(width),矩形的高:\(height)")   //这里能够输出宽和高就是使用了let的原因
    case let .Circle( radius):
        print("圆形的半径:\(radius)")
    }
}
printFigure2(figure: figure)
