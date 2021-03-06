import UIKit

//1.分支语句   if   switch   guard
//
//if语句
var score = 85
if score >= 60 {   //if后面的bool语句不需要括号括起来!!!
    print("及格了！！")          //执行语句!!一定!!要用大括号括起来!!
}

if score >= 60 && score < 90 {    //表示且 &&，表示或 ||
    print("还凑合，不算很优秀")
}
//else if的结构与上面相同
//
//-----------------------------------------------------------分割线-----------------------------------------------------------
//
//switch语句
//可以使用整数，浮点数，字符数，字符串，元组，数值可以是离散的，也可以是连续的范围
//case里面有多个值得时候用逗号隔开
//每个case不需要显式添加break语句，满足某个case它会自动退出
var desc: String
let value = 1.00
switch value {
case 0.0:
    desc = "最小值"
case 0.5:
    desc = "中值"
case 1.0:
    desc = "最大值"
default:
    desc = "其他值"
}
print(desc)
//
//-----------------------------------------------------------分割线-----------------------------------------------------------
//
//guard语句
//guard对于多个if语句的嵌套有更大的优势
//guard语句必须带有else语句
//比如下面的例子
struct Blog {   //这是一个结构体
    let name: String?
    let URL: String?
    let Author: String?
}
//这是多层嵌套if的例子，读起来很吃力
func ifBlog(blog: Blog) {
    if let blogName = blog.name {
        print("这篇博客名: \(blogName)")
        if let blogAuthor = blog.Author {
            print("这篇博客是\(blogAuthor)写的")
            if let blogURL = blog.URL {
                print("这篇博客的地址是: \(blogURL)")
            } else {
                print("这篇博客没有网址！")
            }
        } else {
            print("这篇博客没有作者！")
        }
    } else {
        print("这篇博客没有名字！")
    }
}
//这是guard例子，看起来很清晰
func guardBlog(blog: Blog) {
    //注意，guard里面和if语句的可选值绑定，作用域是整个函数，而不仅仅是guard或者if
    guard let blogName = blog.name else{    //输出名字
        print("这篇博客没有名字！")
        return
    }
    print("这篇博客名: \(blogName)")
    //这是if的写法，实现了和guard相同的功能，在使用的时候可以自行选择guard和if的如下写法
    //这两种都使用了可选值绑定，避免了多层嵌套，代码可读性大大提高
    /*
     if let blogName2 = blog.name {
     print("这篇博客名: \(blogName2)")
     } else {
     print("这篇博客没有名字！")
     return
     }
     */
    guard let blogAuthor = blog.Author else {   //输出作者
        print("这篇博客没有作者！")
        return
    }
    print("这篇博客是\(blogAuthor)写的")
    
    guard let blogURL = blog.URL else {   //输出地址
        print("这篇博客没有网址！")
        return
    }
    print("这篇博客的地址是: \(blogURL)")
}
//上面两个函数执行相同的功能，但是很明显看出，多层if嵌套了之后很难理解，程序可读性较低，而guard的分层明显，可读性高
//
//-----------------------------------------------------------分割线-----------------------------------------------------------
//
//2. 循环语句
//
//while循环
//很好上手，类似下面
var i = 0
while i * i < 1000 {   //条件判断没有括号的！！！语句体一定是大括号的！！
    i += 1
}
print(i)
//
//-----------------------------------------------------------分割线-----------------------------------------------------------
//
//repeat-while循环
//也就是do-while循环
var j = 0
repeat {
    j += 1
} while j * j < 1000    //同上，没有括号
print(j)
//
//-----------------------------------------------------------分割线-----------------------------------------------------------
//
//for循环
//swift3之后抛弃了c语言风格的for循环，变成了for...in循环
for k in 1..<10 {    //表示 1 <= k < 10
    print("\(k) * \(k) = \(k * k)")
}
//这样的循环是没有循环变量的，若是需要循环变量，则需要下面的方法
let numbers = [1,2,3,4,5,6,7,8,9]
for (index, element) in numbers.enumerated() {   //注意enumerated方法
    print("Item\(index):  \(element)")     //index是从0开始的！！！
}
//numbers.enumerated()返回的是集合元组实例（index，element），前面是循环变量，后面是集合元素
//
//-----------------------------------------------------------分割线-----------------------------------------------------------
//
//3.跳转语句
//
//break语句
//大致上与c语言风格的break相同，就是直接终止循环，跳出整个循环体，但是特例就是带标签的break
label1: for x in 0 ..< 5 {   //加了个标签
    label2: for y in (1...5).reversed() {
        if y == x {
            break label1    //跳出label1，也就是外层循环相当于一次性终止了两个循环
        }
        print("(x,y) = (\(x), \(y))")
    }
}
//带标签之后会跳出指定的循环，类似相当于C语言的goto语句
//用在“多重嵌套”的循环语句中会有好处
//
//-----------------------------------------------------------分割线-----------------------------------------------------------
//
//continue语句
//用法与其他语言的用法都相同这里就不再赘述了，就是跳出本次循环，执行下一次的循环
//于心不忍还是举个栗子
for number in 1..<10 {
    if number == 5 {    //当number== 5的时候，跳出了本次循环，可以看到输出是没有5的
        continue
    }
    print("我是数字！！！\(number)！！但是我不是5😯")
}
//continue也有带标签的用法，用法等同于break的带标签语句，就不举例子了
//
//-----------------------------------------------------------分割线-----------------------------------------------------------
//
//fallthrough语句
//这是贯通语句，只能用在switch中
//switch中的语句默认是不贯通的，执行完一个case之后就会跳出switch，也就是满足就break了
//举例如下
var ft1 = 1
var ft2 = 4
switch ft2 {
case 1:
    ft1 += 1
case 2:
    ft1 += 1
case 3:
    ft1 += 1
case 4:   //这里满足，然后ft1+1
    ft1 += 1
fallthrough   //这里不跳出，执行下一个case
case 5:
    ft1 += 1     //又加一
fallthrough   //又不跳出
default:           //default，又加一
    ft1 += 1
}  //一共加三
print(ft1)  //结果是4
//输出结果为4，因为有fallthrough，执行完一个case之后直接进入下一个case，不会立刻跳出
//但是这种用法用的很少，我们还是要了解一下
//
//-----------------------------------------------------------分割线-----------------------------------------------------------
//
//范围与区间运算符
//半开区间     20 < x <=100   <=>    20..<100           ---------左开右闭
//闭区间        20 <= x <= 100    <=>    20...100        ---------左右都闭
//但是！！！并没有    20<..100   左闭右开，这是没有的！！！
//
//-----------------------------------------------------------分割线-----------------------------------------------------------
//
//值绑定
//也就是在一些控制语句中临时地将表达式的值赋给一个常量或者变量，使之能够在控制语句中使用
//用在if语句的判断条件中
//用法的🌰见上面的辨析if多层嵌套中
//用在guard语句的判断条件中
//用在switch语句的case语句中
//可以有多个值绑定，只要有一个绑定失败，则整个语句为false
//
//-----------------------------------------------------------分割线-----------------------------------------------------------
//
//where语句
//类似于SQL中的where语句（我只是举个例子，不知道SQL问题也不大）
//switch中使用where
//where就是筛选出所有满足条件的项
var student = (id: "1002", name: "jack", age: 32, chineseScore: 90, englishScore: 91)   //这是一个元组
var Desc: String
switch student {
case (_, _, let age, 90...100, 90...100) where age > 20:    //条件是满足年龄大于20
    Desc = "excellent"
case (_, _, _, 80..<90, 80..<90):
    Desc = "good"
case (_, _, _, 60..<80, 60..<80):
    Desc = "bad"
case (_, _, _, 60..<80, 90..<100), (_, _, _, 90..<100, 60..<80):
    Desc = "nice"
default:
    Desc = "too bad"
}
print(Desc)
//
//
//for语句中使用where
let number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
for item in number where item > 5 {   //条件是item>5
    print(item)
}
//通过上面的例子可以很明显看出来where的用法，也就是筛选出符合where条件的值
