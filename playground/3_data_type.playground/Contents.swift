
//提供各种类型的Int数据
print("UInt8 range: \(UInt8.min) ~ \(UInt8.max)")
print("UInt16 range: \(UInt16.min) ~ \(UInt16.max)")
print("UInt32 range: \(UInt32.min) ~ \(UInt32.max)")
print("UInt64 range: \(UInt64.min) ~ \(UInt64.max)")
//单单声明Int的话跟机器有关，本机是64位平台
print("Int range: \(Int.min) ~ \(Int.max)")

//声明变量的时候尽量采用类型推断啊，这个前面也说过的，这样代码更简洁，除非需要特殊的，比如Int16这样的才需要声明一下

//默认！！声明的浮点数都是double，64位的
//除非你声明是float，32位的


//下面给整数28赋值
let decimalInt = 28
let binaryInt = 0b11100 //二进制表示，数字0和字母b
let octalInt = 0o34         //八进制表示，数字0和字母o
let hexadecimalInt = 0x1C //十六进制表示，数字0和字母x
//但是输出的时候都是以十进制输出的，比如
print(binaryInt)

//十进制表示指数
var myMoney = 3.36e2
var yourMoney = 1.56e-2
print("\(myMoney)比你的钱多\(yourMoney)")

//十六进制表示指数，用p表示幂，但是p2表示的是2的平方，不推荐！！十六进制表示幂
var hexadecimalNum = 0x3p2
print(hexadecimalNum)

//为了阅读方便，整数和浮点数均可以添加多个0或者下划线“_”来使得可读性提高
var number1 = 000.0156
var number2 = 3_33_333_3333
print(number1)
print(number2)

//类型转换问题，不像其他语言，swift没有隐式类型转换，只能显式转换
//显示转换类似下面这样
let num1:UInt8 = 16
let num2:UInt16 = 222
//let total1 = num1 + num2，这个会报错，要显式转换
//注意：要小的转大的，不然可能会数据丢失
let total2 = UInt16(num1) + num2


//布尔值，只有true和false，没有1表示true，0表示false这个说法
var is🐎 = true
var is🐼: Bool = false

//元组类型（tuple）
//元组就是一个字段，相当于数据库表里面的一行数据
//更直观，相当于一个表，里面都很多种数据
//两种写法
//("1001", "张三", 30 ,90)
//(id: "1001", name: "张三", english_score: 30 ,chinese_score: 90)
//但是显然第二种更好，每个字段的意义都很明显
let student = (id: "1001", name: "张三", english_score: 30 ,chinese_score: 90)
print("学生:\(student.name),学号:\(student.id)")
//要是不给每个字段赋予意义，那就每个字段按序号排列，比如student.0就表示id

//元组的值也能赋给变量，比如
let (id, name, _, _) = student
print(id)
print(name)
//不需要的字段就用下划线“_”替代


//有个很重要的类型：可选值类型
//很多值为了避免使用的时候出错会声明为可选值，因为如果不声明为可选值，若该值为空，则使用的时候会报错

var n1 = 10
//n1 = nil
var n2 = "hhh"
//n2 = nil
//上面这两种也是不行的，因为Int和String是不能被声明为nil（空值）的
//也就是说，一旦一开始没被声明为可选值，那么之后就不能再赋值为nil
//
//可以这样
var str: String? = nil
var str2: String! = nil

//？ 和 ！的区别
//用？声明的都是可选值
var n11 :Int? = 10
print(n11)  //输出的是Optional(10)
//如果这样输出就正常,感叹号是拆包的东西，将可选值类型转换成正常的类型
print(n11!)
//注意哦，加了问号就不是正常类型了，就不能和正常类型一起愉快de play
//var score = 10 + n11,这个会报错，因为类型不一样啊，下面就是对的，因为n11拆包了
let score = 10 + n11!

//用？声明的要显式拆包，用！的就是隐式拆包，他会自己拆包
var n22 : Int! = 10
let score2 = 10 + n22
//这么写也是可以的    let score2 = 10 + n22!


//很重要的是，在不确定可选值是不是空值的时候最好不要拆包，不然会出问题
//可选类型在if或者while中赋值并进行判断的称为“可选绑定”
let nnn: Int? = 100
//一旦nnn为nil那么下面的就赋值失败，导致if判断为false
if let mmm = nnn {
    print("ahahhaha")
}
