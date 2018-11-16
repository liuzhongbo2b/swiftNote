//在其他语言中结构体得不到重视，因为结构体能做到的事情类也能做到，而且类能做的更多
//但是在swift中结构体是很重要的部分，因为它把结构体作为实现面向对象的重要手段
//swift中结构体功能强大，可以看成是一种“轻量级的类”，另一种说法是，类是结构体的超集
//结构体具有的功能：
//定义和使用属性，方法，下标，构造函数
//结构体不具有的功能(也就是类具有的功能)：
//继承性，运行时的类型强转，析构函数，使用引用计等等
//
//
//
//这是一个类Employee
class Employee {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double
    init() {
        salary = 0.0
    }
    var dept: Department?
    //在类里面声明的属性要么是可选值，要么就得赋初值，要么声明构造函数赋初值，也就是说，类实例化的每个对象，他的所有属性都有值
}
//这是一个结构体
struct Department {
    var no: Int = 0
    var name: String = ""
    //结构体也是一样，也需要初始化属性
}
//下面是类和结构体的实例化，但是“只有类的实例化才能叫对象”，枚举，函数类型，闭包开辟内存空间的过程都能叫实例化，结果叫“实例”，不能叫对象
let emp = Employee()   //实例化一个Employees对象
var dept = Department()     //实例化一个Department实例
//类一般是声明为let的，因为表示对该对象的引用不可改变，但是对象里面的成员是可以改变的
//注意！！！只有类是引用类型
//结构体是值类型
//所以如果结构体类型声明为let，那么结构体里面的内容也是不能改变的
//
//下面是实例
dept.no = 10
dept.name = "Salse"

emp.no = 1000
emp.name = "Martin"
emp.job = "SalseMan"
emp.salary = 1250
emp.dept = dept

//实际上，下面这个更新department的函数会报错，因为传进来的是结构体，是值类型，不能改变其值
//func updateDept(dept: Department) {
//    dept.name = "Research"
//}
//想要改变这个，就要使用前面说过的传递引用的方式，传进来的是引用，自然就能改变值了
func updateDept(dept: inout Department) {  
    dept.name = "Research"
}
//这个函数能运行，因为传的是类的对象，是引用类型，能改变值
func updateEmp(emp: Employee) {
    emp.job = "Clerk"
}
//
//
//引用类型的比较
//只能用 === 和 ！== 来进行引用类型的比较
let emp1 = Employee()
emp1.no = 1000
emp1.name = "Martin"
emp1.job = "Salesman"
emp1.salary = 1250

let emp2 = Employee()
emp2.no = 1000
emp2.name = "Martin"
emp2.job = "Salesman"
emp2.salary = 1250

if emp1 === emp2 {
    print("equal")
} else {
    print("not equal")
}
//
//
//但是！！！虽然struct是值类型，还是不能用 == 或者 ！== 来进行比较
var dept1 = Department(no: 10, name: "Sales")
var dept2 = Department(no: 10, name: "Sales")
//诶，直接这么写是不阔以滴，要进行运算符重载

func == (lhs: Department, rhs: Department) -> Bool {
    return lhs.name == rhs.name && lhs.no == rhs.no
}
func != (lhs: Department, rhs: Department) -> Bool {
    if (lhs.name != rhs.name || lhs.no != rhs.no) {
        return true
    }
    return false
}
if dept1 == dept2 {
    print("equal")
} else {
    print("not equal")
}
//
//
//可以使用内部类（也就是类型嵌套，比如类里面嵌类这样子），但是不是很推荐，因为可读性较差
class Employee2 {
    var no: Int = 0
    var name: String = ""
    var job: String = ""
    var salary: Double = 0
    var dept: Department = Department()
    var day: Weekdays = Weekdays.Friday
    
    //嵌套的结构体
    struct Department {
        var no: Int = 10
        var name: String = "Sales"
    }
    
    //嵌套的枚举
    enum Weekdays {
        case Monday
        case Tuesday
        case Wednesday
        case Thursday
        case Friday
        
        //枚举里面嵌套的结构体（二次嵌套）
        struct Day {
            static var message: String = "Today is ..."
        }
    }
    
}
//在上面这个类里面，我们嵌套了结构体，枚举，在枚举里面我们又定义了一层结构体
//这么重复嵌套虽然能在一个类里面表现更多的信息，将一个类的信息表现的更完整，但是可读性会变差
//所以！！尽可能避免多层嵌套，两层是允许的
//
//
//可选链
class EmployeeChain {
    var no: Int = 0
    var name: String = ""
    var job: String?
    var salary: Double = 0.0
    //var dept: DepartmentChain = DepartmentChain()   //---1
    var dept: DepartmentChain?
}

struct DepartmentChain {
    var no: Int = 0
    var name: String = ""
    //var comp: CompanyChain = CompanyChain()   //---2
    var comp: CompanyChain?
}

class CompanyChain {
    var no: Int = 100
    var name: String = "xixi"
}
//由上面可以看到，EmployeeChain类关联了DepartmentChain结构体，DepartmentChain结构体关联了CompanyChain类，中间哪一个环节断了后面的都会报错
//但是不可能所有时候一定是环环相扣的，有时候中间某一环可能没有值，见上述注释，用可选值来代替初始话语句，这样，当确实有值的时候才进行初始化，减少内存浪费
//但是，出现了一个新的问题，可选值是需要拆包的
//所以就有了新的表示方式
//print(emp.dept!.comp!.name)
//但是！！！要是有的值是nil怎么办？显式拆包太暴力了，换个方式，隐式拆包
//print(emp.dept?.comp?.name)
//👆这样的，就叫可选链（可选值的链式形式），温柔拆包方式
let jjj = EmployeeChain()
jjj.dept = DepartmentChain()
jjj.dept?.comp = CompanyChain()

print(jjj.dept?.comp?.no)
//这一句要求每一环必须被实例化，因为用的是“？”，所以如果中间一环断了，不会报错，而是输出“nil”，当每一环都实例化之后，会输出Optional（100），说明可选链的结果还是可选类型
//要输出100，就z对最后的结果进行强制拆包，像这样------(jjj.dept?.comp?.no)!
//print(jjj.dept.comp.no)，这是错误写法，可选值不拆包不能访问
//
//类型嵌套也是可以用可选链的，但是，还是不太推荐类型嵌套
//
//
//复习可选值
let result: Double? = 111
print(result!) //显示拆包
//
let result2: Double! = 121
print(result2) //隐式拆包
//总结：可选链用“？”的目的是为了程序过程中万一出现了问题，程序最多返回nil，但是不会发生异常
//
//
//
//----------------------------------------------------访问限制-------------------------------------------------------------
//一共有五种访问级别：open，public，internal，fileprivate，private
//可以修饰类，结构体，枚举---------------面向对象类型
//还可以修饰变量，常量，下标，元组，函数，属性等------------------一般类型
//
//在了解五种访问权限之前，我们先了解下先修知识
//模块（module）：应用程序包或者框架，用import来导入，以此来使用其中的方法，类等
//应用程序包：可执行的！！！通过application模板创建
//框架（framework）：框架类似于应用程序包，区别在于，编译后的是不可执行的文件
//源文件：也就是单个的swift文件
//
//open：无论是模块内，还是模块外，都能被自由访问
//public：同一模块里，public和open一样，但是在不同模块里，public声明的类不能被继承，属性方法不能被重写
//internal：只能在自己的模块里被访问（这也是默认访问权限）
//fileprivate：只能在当前源文件被访问
//private：只能在类内部被访问
//
//来看一个简单的例子，关于private的
class ClassA {
    //修改为private则会报错，因为私有属性不能被继承
    fileprivate var name: String {
        return ""
    }
}

class ClassB: ClassA {
    override var name: String {
        return "tony"
    }
}

let classB = ClassB()
print(classB.name)
//
//
//关于open和public的就不在这里举例了，比较简单
//
//统一性原则
//1. 类或者结构体用private啊，internal定义的时候，那么里面的属性啊，方法啊不能用public，也就是通俗点讲，你儿子的年龄永远不可能比你大
//2. 函数的返回级别不能高于参数和返回类型，比如函数是public，但是参数是private，那么函数能被任何人访问，但是你却不能访问参数，就很矛盾
//
//设计原则
//1. 如果开发的是APP，那么你所用的东西都是给自己用的，那么用默认的就可以了
//2. 如果开发的是框架，那么你写的东西都是给其他人去使用的，那么给别人用的接口之类的就用public，那么不想给别人看的就是private或者internal
//
//元组类型，那么整个元组的类型遵循元组元素的最低级的元素访问类型。更好理解的就是，访问权限自上而下兼容
//
//枚举类型，枚举的成员不需要指定访问级别，成员的访问级别继承自该枚举
//
//
//
//讲了这么多，回到最关键的问题：结构体和类这么相似，那么，我们怎么去选择呢？？？
//我们来看看区别
let employ1 = Employee()
employ1.name = "john"
employ1.no = 10

let employ2 = Employee()
employ2.name = "john"
employ2.no = 10
//我们在这儿进行类的实例化，虽然他们的属性值一样，但是他们还是两个不同的对象

var depat1 = Department()
depat1.name = "sales"
depat1.no = 10

var depta2 = Department()
depta2.name = "sales"
depta2.no = 10
//这我们进行结构体的实例化，虽然他们是两次实例化，但是，他们，是相等的（想不到吧）
//
//
//以下情况请使用结构体
//1.结构体的主要目的是用来封装少量相关简单数据值。
//2.有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
//3.任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
//4.结构体不需要去继承另一个已存在类型的属性或者行为。
//
//在其他情况的时候，用类！！！也就是说，功能一旦多了起来，就用类吧。
