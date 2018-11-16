import UIKit

// func 函数名(参数列表) -> 返回值类型 {
//      语句组
//       retuen 返回值
// }

//来看一个示例函数
func rectangleArea(W width: Double, H height: Double) -> Double {  //W是参数标签，width是参数名，double是参数类型
    let area = width * height
    return area
}
print("长方形的面积是：\(rectangleArea(W: 480, H: 320))")

//函数参数
//1. 使用参数标签
//也就是为每一个参数提供参数标签，标签的命名应该是唯一的，也就是上面的函数1
//若不声明参数标签，则标签为函数的参数名！！！切记，一般是不写参数标签的，因为参数名已经能标识所需信息了
func rectangleArea2(width: Double, height: Double) -> Double {
    let area = width * height
    return area
}
print("长方形的面积是：\(rectangleArea2(width: 480, height: 320))")
//
//2. 可省略参数标签，这个时候要使用 “ _ ” 来代替参数标签，调用的时候就不带参数标签了
func rectangleArea3(_ width: Double, _ height: Double) -> Double {
    let area = width * height
    return area
}
print("长方形的面积是：\(rectangleArea3(480, 320))")
//
//3. 参数可以有默认值,不给参数赋值，则参数为默认值
func mekeCoffee(type: String = "卡布奇诺") -> String {
    return "制作一杯\(type)"
}
print("\(mekeCoffee())")
print("\(mekeCoffee(type: "拿铁"))")
//
//4. 可变参数，即参数的个数可以变化，但是这些参数都是同类型的参数，在参数名后面加上 ... 即可
func sum(numbers: Double...) -> Double {
    var total: Double = 0.0
    for number in numbers {
        total += number
    }
    return total
}
print(sum(numbers: 100, 20, 30))
print(sum(numbers: 10, 2, 3, 9))
//
//5. 值类型参数的引用传递
//inout关键词
func update(value: inout Double) {
    value *= 2
}
var value = 2.0
update(value: &value)     //调用方法传参数的时候要记得   &
print(value)
//
//---------------------------------------------------------------分割线---------------------------------------------------------------
//
//函数返回值
//1. 无返回值函数
//有三种表示形式
func returnFunc1(value: String) {
    print(value)
}
func returnFunc2(value: String) ->() {
    print(value)
}
func returnFunc3(value: String) -> Void {
    print(value)
}
//
//2. 多返回值函数
//第一种方法就是将多个参数声明为引用类型，这样就不用设置返回值参数的值也会改变
//这种方法比较另类，很少见很少见很少见！！！
//
//第二种方法就是返回 “元组” 类型
func position(dt: Double, speed: (x: Int, y: Int)) -> (x: Int, y: Int) {
    let posx: Int = speed.x * Int(dt)
    let posy: Int = speed.y * Int(dt)
    return (posx, posy)
}
let move = position(dt: 60.0, speed: (10, -5))
print("物体的位移：\(move.x), \(move.y)")
//
//---------------------------------------------------------------分割线---------------------------------------------------------------
//
//函数的类型
//函数的类型就是参数类型加上返回值的类型
//比如上面的函数的类型就是（double，（Int，Int））->（Int，Int）
//
//1. 作为函数返回值类型使用
func rectanglearea(width: Double, height: Double) -> Double {
    let area = width * height
    return area
}
func trianglearea(bottom: Double, height: Double) -> Double {
    let area = bottom * height / 2
    return area
}
func getArea(type: String) -> (Double, Double) -> Double {
    var returnFunction: (Double, Double) -> Double    //这是定义了一个函数变量
    
    switch type {
    case "rect":
        returnFunction = rectanglearea(width:height:)
    case "tria":
        returnFunction = trianglearea(bottom:height:)
    default:
        returnFunction = rectanglearea(width:height:)
    }
    
    return returnFunction
}
//使用函数
var area: (Double, Double) -> Double = getArea(type: "tria")
print("求三角形的面积：\(area(10, 15))")
//
//2. 作为函数的参数使用
func getAreaByFunc(funcName: (Double, Double) -> Double, a: Double, b: Double) -> Double{
    let area = funcName(a, b)
    return area
}
var result: Double = getAreaByFunc(funcName: trianglearea(bottom:height:), a: 10, b: 15)
print("三角形的面积：\(result)")
//
//---------------------------------------------------------------分割线---------------------------------------------------------------
//
//函数嵌套
func calculate(ope: String) -> (Int, Int) -> Int {
    func add(a: Int, b: Int) -> Int {
        return a + b
    }
    func sub(a: Int, b: Int) -> Int {
        return a - b
    }
    
    var result: (Int, Int) -> Int
    switch ope {
    case "+":
        result = add(a:b:)
    case "-":
        result = sub(a:b:)
    default:
        result = add(a:b:)
    }
    return result
}
let f1: (Int, Int) -> Int = calculate(ope: "+")
print("10 + 5 = \(f1(10, 5))")
