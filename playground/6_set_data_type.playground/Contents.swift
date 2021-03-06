import UIKit

//1.数组
//
//有序的相同类型的元素构成的集合，可以有重复的元素
//数组关心元素是否有序，而不关心是否重复，这是数组的原则！！！
//foundation框架里面也有数组类型，NSArray，这是类（引用类型），普通的数组是结构体（值类型）
//声明数组的方法，一共四种
var studentList1: Array<String> = ["mike", "jack", "bang", "bob"]
var studentList2: [String] = ["mike", "jack", "bang", "bob"]
let studentList3: [String] = ["mike", "jack", "bang", "bob"]  //这个是let声明的数组，是常量，是不可变的，必须在声明的时候初始化，初始化之后不可变
//这是个空数组，但是注意，这个数组开辟了内存空间
var studentList4 = [String]()
//var声明的是可变数组，若是数组不改变，就声明成let的，因为不可变的数组“访问效率”更高
//
//追加数组元素的方法（就是往数组里面添加元素）
var studentList = ["张三", "李四", "王五"]
print(studentList)
studentList.append("董六")    //这个只能增加单个元素，在尾巴后面添加
studentList += ["刘备"]   //这个也是在尾巴后面添加，相当于两个数组拼起来
print(studentList)
//插入数组元素的方法
studentList.insert("张飞", at: 0)  //在数组的第0号位置插入元素，其他元素后移一位
print(studentList)
//删除元素的方法
studentList.remove(at: 2)  //删除标号为2的元素（也就是第三个数组元素，数组是从标号0开始的）
print(studentList)
//替换元素的方法，这个比较简单，直接给新的值就行了
studentList[0] = "诸葛亮"
print(studentList)
//数组的遍历上一章的for...in循环讲过，就不再赘述了
//
//-----------------------------------------------------------------分割线-----------------------------------------------------------------
//
//2.字典集合
//字典集合由两部分组成，键（key）和值（value）
//键是不能重复的，值是可以重复的，类比中华字典，每个词有好多个意思，但是字典里没有重复的词语
//很重要的一点！！字典是无序的哦，只关注内容（对比数组）
//foundation框架中有NSDictionary，这个是类，普通的字典是结构体
//
//声明字典的方法，四种种方法
var studentDictionary1: Dictionary<Int, String> = [102: "张三", 105: "李四", 109: "王五"]
var studentDictionary2 = [102: "张三", 105: "李四", 109: "王五"]  //可变字典
let studentDictionary3 = [102: "张三", 105: "李四", 109: "王五"]   //常量字典，不可变

var studentDictionary4 = Dictionary<Int, String>()   //空字典
var studentDictionary5 = [Int: String]()        //空字典
//let声明的字典的性质等同于不可变数组，关于可变字典与不可变字典的性质等同于数组
//foundation框架中也有可变字典类型，NSMutableDictionary，这个继承自NSDictionary
//
//给字典增加元素
//给一个不存在的值赋一个有效值就可以了
studentDictionary1[101] = "董六"
print(studentDictionary1)
print(studentDictionary1.count)    //字典的元素个数
print(studentDictionary1.capacity)  //字典的容量，emmm，此处为6的倍数，因为涉及到
//
//给字典替换元素
//1.直接给存在的键赋值
studentDictionary1[109] = "王五五"
print(studentDictionary1)
//2.用updatevalue方法
studentDictionary1.updateValue("王五五五", forKey: 109)
print(studentDictionary1)
//
//删除字典元素
studentDictionary1.removeValue(forKey: 109)
print(studentDictionary1)
//updateValue和removeValue都是有返回值的函数，返回的是值类型的可选值类型，如需要保存值，则要拆包处理
//
//字典的遍历
print("----------------遍历值----------------")
for studentID in studentDictionary1.keys {
    print("学号：\(studentID)")
}
print("----------------遍历键----------------")
for studentName in studentDictionary1.values {
    print("姓名：\(studentName)")
}
print("----------------遍历键值----------------")
for (studentID, studentName) in studentDictionary1 {
    print("\(studentID)    \(studentName)")
}
//
//-----------------------------------------------------------------分割线-----------------------------------------------------------------
//
//set集合
//由一串无序的不能重复的相同类型的元素构成的集合
//强调的是无序！！！不重复！！！
//set是结构体类型
//foundation框架中有NSSet是类类型，默认提到的是一般的集合
//声明一个set
var studentSet1: Set<String> = ["张三", "李四", "王五", "董六"]
var studentSet2 = Set<String>()
//注意了！！！下面这样声明的是数组，不是set！！！
let studentSet3 = ["张三", "李四", "王五", "董六"]
//关于可变set与不可变set之间的关系，见上面数组和字典
//foundation框架中的可变set是NSMutableSet，继承与于NSSet
//
//删除元素
studentSet1.remove("张三")
print(studentSet1)
//删除第一个元素
studentSet1.removeFirst()
print(studentSet1)
//插入元素
studentSet1.insert("诸葛亮")
print(studentSet1)
//
//是否包含特定元素
if studentSet1.contains("诸葛亮") {
    print("包含")
}
//
//集合的遍历，同数组的遍历方法，这里就不再赘述了
//
//set集合的运算，这个地方好好学学
let A: Set<String> = ["a", "b", "e", "d"]
let B: Set<String> = ["d", "c", "e", "f"]
print("A与B的交集:\(A.intersection(B))")     //求交集
print("A与B的并集:\(A.union(B))")             //求并集
print("A与B的差集:\(A.subtracting(B))")      //求差集
if A.subtracting(B).isSubset(of: A) {           //判断子集
    print("这是A的子集")
}

