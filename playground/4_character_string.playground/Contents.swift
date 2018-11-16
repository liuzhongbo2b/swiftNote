
//swift采用Unicode编码
//可以有单字节，双字节，四字节编码
//表现形式    \u{n}
//n代表1~8个十六进制数

//划重点！！！swift的“字符”是括在双引号里面的！！！
//比如下面这样
let sign1 = "&"
let sign2 = "\u{26}"
let sign3: Character = "☺"  //字符是Character

//如果不声明是character，那么编译器自动推断出是字符串类型的！
//所以上面的  &  就会是字符串类型


//有关转义符的相关内容，等同于其他语言也是像下面这样
//   \t      \n        \\        \"        \'        \r  关于转义字符可上网查，所有语言的转义字符通用
print("hello\\my house\"")


//事实上，swift里面的字符串是一个结构体，不同于java，字符串是一个类
//foundation框架里面的NSString是一个类
var 🚗 = "🐶🐈🐷🐔🐍🐎🐟🐫🐼🐒🐛🐦🐘"
print("已经上车的小动物有\(🚗.count)个")   //字符数量
print("已经上车的小动物有\(strlen(🚗))个")   //字符串长度
print("已经上车的小动物有\((🚗 as NSString).length)个")   //转换成NSString类型再求长度
//有很多和字符串有关的函数，类比java

let 熊 = "🐻"
let 猫 = "🐱"
let 🐼 = 熊 + 猫
print(🐼)
//用+来拼接字符串,或者+=
//也可以用appending
let 🐼2 = 熊.appending(猫)
print("\(🐼2)")

let emptyString = String()  //这是一个空的字符串，什么也没有
//由于是结构体，所以可以用构造函数来初始化

//字符串的插入
🚗.insert("🦆", at: 🚗.startIndex)   //插在第一个的前面
print("\(🚗)")

//字符串的删除
🚗.remove(at: 🚗.index(before: 🚗.endIndex))    //删除最后一个
print("\(🚗)")

//字符串的范围删除
var beginIndex = 🚗.startIndex    //确定头
var endIndex = 🚗.index(beginIndex, offsetBy: 5)     //确定尾，从第一个开始往后数五个
var range = beginIndex...endIndex    //确定范围
🚗.removeSubrange(range)   //删除
print("\(🚗)")
//String.index是索引类型
//range是范围类型

//字符串的替换
🚗.replaceSubrange(range, with: "C++")   //用c++替换range范围的字符串
print("\(🚗)")

//字符串的比较（靠什么比大小我给忘了）
if 熊 > 猫 {
    print("🐻大于🐱")
} else {
    print("🐻小于🐱")
}

🐼 == "🐻🐱" ? print("相等") : print("不相等")

//注意哦，普通的String是结构体，用==和！=比较
//NSString中的字符串要用===和！==来比较

//判断前缀和后缀，前缀：以XX开头的，后缀：以XX结尾
let str233 = "abcdefg"
if str233.hasPrefix("abc") {
    print("有前缀")
}
if str233.hasSuffix("defg") {
    print("有后缀")
}
