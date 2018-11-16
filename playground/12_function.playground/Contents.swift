import UIKit

//方法实质上就是----函数
//但是，方法是定义在结构体，枚举，类里面的函数
//如果说属性是静态的，代表了类的某些性质，那么方法就是动态的，代表类的行为/操作
//方法和函数的区别就是，方法的调用是要有主体的，也就是说方法是要被调用的，而函数则不需要
//
//
//实例方法，也就是普通的方法，通过实例化的对象来调用
class Account {
    var amount: Double = 10_000.0           //账户余额
    var owner: String = "Tony"                    //账户名
    //计算利息
    func interestWithRate(rate: Double) -> Double {
        return rate * amount
    }
}
let myAccount = Account()                //实例化一个账户对象
print(myAccount.interestWithRate(rate: 0.01))        //对象调用实例方法
//
//
//
//可变方法
//结构体和枚举类型中的方法是不能够修改值类型变量的属性的，需要将方法声明为可变的才行
struct Department {
    var emp: [Int] = [Int]()
    mutating func insert(employee: Int) -> Void {  //因为emp是数组，是值类型，故此处声明为可变方法，否则会报错
        emp.insert(employee, at: 0)
    }
}
var dept: Department = Department()
dept.insert(employee: 1)
//另一种写法是，Foundation框架的NSMutableArray，因为NSMutableArray是引用类型
//为什么类可以直接修改呢，以为类本身就是引用类型，是可变的
//
//静态方法
//和静态属性一样，直接通过类调用
//但是static静态方法不能被重写
class ExampleA {
    class func cal() -> Int{ //此处要用class来修饰，若换成static，则不能被重写
        return 10;
    }
}
class ExampleB: ExampleA {
    override static func cal() -> Int {
        return 20
    }
}
