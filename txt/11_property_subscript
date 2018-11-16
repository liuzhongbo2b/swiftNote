import UIKit

//属性-----property
//1. 存储属性
//存储属性可以储存数据，分为常量属性和变量属性
//适用于类和结构体，不适用于枚举类型
class Example {
    var name: String = ""
}
let cmp = Example()
cmp.name = "100"    //属性通过 “   .   ”  来调用
//
//下面来看一个例子
class Employee {    //职员类
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0
    var dept: Department = Department()
    //lazy var dept: Department = Department()                   ------------------------------------------------------       1
}

struct Department {   //部门结构体
    var no: Int = 0
    var name: String = ""
}
//每一个员工必然会属于一个部门，但是，有时候我们只关心他的名字工作之类的，并不关心他的部门，但是，每当实例化一个员工，也会实例化一个部门，这样必定会浪费内存空间
//所以！这里我们介绍一个延迟加载技术
//为了节省代码空间，看上面绿绿的注释，标号1
//解释一下，lazy，也就是懒的意思，也就是说，你不碰它，他就不会动-----------------专业地讲，你实例化员工之后，部门并不会随之实例化，只有当你第一次使用到部门的属性的时候，他才会去开辟内存空间，进行实例化，这样的话，显著减少了这样的链式结构的内存浪费
//
//
//2. 计算属性
//属性本身不存储数据，而是从其他存储属性中计算得到数据
//类，结构体，枚举都可以定义计算属性
//举例如下：
class CalculatePro {    //可以是类，结构体，或者枚举
    var name1: String = ""
    var name2: String = ""
    var name3: String {   //计算属性
        get {     //get函数，来得到值
            return name1 + name2
        }
        set(newName) { //set函数，来设置值
            var name = newName.components(separatedBy: ".")
            name1 = name[0]
            name2 = name[1]
        }
    }
}
//实例化一个对象
let name = CalculatePro()
name.name3 = "jjjj.ssss"
print(name.name1)
print(name.name2)
//上面还能这么写set，因为set传入的参数可以直接用newValue来替换
/*
 set {
 var name = newValue.components(separatedBy: ".")
 }
 */
//
//
//当一个计算属性为只读时，叫只读计算属性，省略set，甚至省略get，但是，就不能赋值了，否则编译出错
/*
 var name3: String {
    return name1 + name2
 }
 */
//
//
//结构体的计算属性
struct Department1 {
    let no: Int = 0
    var name: String = ""
    
    var fullName: String {
        return "Swift." + name + ".D"
    }
}
//
//枚举的计算属性
enum Weekdays: String {
    case Monday = "Mon"
    case Tuesday = "Tue"
    case Wednesday = "Wed"
    case Thursday = "Thu"
    case Friday = "Fri"
    
    var message: String {
        return "today is " + self.rawValue           //self可以省略，但是如果属性名和其他变量或常量名字冲突，不能省略
    }
}
//总结来看，计算属性就是Java的一种普通属性，但是只是将单独的有get，set方法的属性分离出来成立了计算属性
//其实也看得出来，枚举，类，结构体的计算属性没多大区别
//
//属性观察者
class example {
    var name: String = "jjj" {
        willSet(newNameValue) {  //在即将改变值的时候调用
            print("new")
        }
        didSet(oldNameValue) {  //在值改变之后调用
            print("old")
        }
    }
}
let examp = example()
examp.name = "hh"
//与get，set方法只能二者存一，不能全写，属性观察者存在的意义就是为了节省代码，在某些时候使用会比get，set方法方便
//PS: 在写代码的时候，willSet和didSet方法没有代码补全，但是编译还是能够通过的
//本质上，这还是属于存储属性的，所以枚举没有属性观察者，因为枚举没有存储属性
//
//
//静态属性————static
//静态属性是所有实例化共享的，也就是说直接用类名调用，所有对象一起共享
//类静态计算属性，在子类中不能被重写
//静态计算属性，不能访问实力属性（存储属性，计算属性），但是可以访问其他静态属性
//
class staticClass {
    static var name: String = "999"
}
staticClass.name = "name"
print(staticClass.name)
//
//
//下标：subscript
struct DoubleDimensionalArray {
    let rows: Int, column: Int
    var grid: [Int]
    
    init(rows: Int, column: Int) {
        self.rows = rows
        self.column = column
        grid = Array(repeating: 0, count: rows * column)
    }
    
    subscript(row: Int, col: Int) -> Int {
        get {
            return grid[row * column + col]
        }
        set(newValue) {
            grid[row * column + col] = newValue
        }
    }
}
let COL_NUM = 10
let ROW_NUM = 10
var ary2 = DoubleDimensionalArray(rows: 10, column: 10)
for i in 0 ..< ROW_NUM {
    for j in 0 ..< COL_NUM {
        ary2[i, j] = i * j
    }
}

for i in 0 ..< ROW_NUM {
    for j in 0 ..< COL_NUM {
        print("\t\(ary2[i, j])", terminator: " ")
    }
    print("\n")
}
//subscript的作用就是能够让类或者结构体实例化之后能够按照下标去访问，也就是说，可以当成数组一样去使用，可以看成是数组的扩充集
//上面只是一个例子，为了演示下标的使用，平常编码的时候双循环尽量少使用，会很耗性能
