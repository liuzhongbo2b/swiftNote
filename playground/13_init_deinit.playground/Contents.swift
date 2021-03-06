import UIKit

//----------------------------------------------------------构造函数----------------------------------------------------------
//构造函数是在类或者结构体实例化的同时调用的，称为init方法
//没有返回值，可以重载
//编译器会提供默认的构造函数，但是默认的构造函数什么也不做
//
//下面看结构体的默认构造函数，有所特殊性
struct Rectangle {
    var width: Double = 0.0
    var height: Double = 0.0
    init() {        //这是默认构造函数1，类只有这一个默认构造函数
        
    }
    init(width: Double, height: Double) {       //这是默认构造函数2
        self.width = width
        self.height = height
    }
}
//
//
//构造函数的作用，前面讲过，每个属性都得赋初值，否则编译不通过，但是如果有构造函数，在构造函数里赋了初值，那么声明属性值的时候可以不赋初值
//注意：构造函数不能初始化静态属性，计算属性本身不需要初始化，不考虑在内
//ps：构造函数可以对常量进行初始化
//
//
//----------------------------------------------------------参数标签----------------------------------------------------------
//通俗的讲，就是给具体的参数名起一个别名
class parTag {
    var width: Double = 0.0
    var height: Double = 0.0
    init(W width: Double, H height: Double) {
        self.width = width
        self.height = height
    }
}
let parTagInstance = parTag(W: 99, H: 99)       //这个时候W和H就是width和height的标签，也就是别名
//例外的就是，结构体的默认构造函数是有两个的，在实例化的时候可以提供参数，顺序是属性的定义顺序
//对于没有提供参数标签的构造函数，默认是参数名
//
//
//
//----------------------------------------------------------重载构造函数----------------------------------------------------------
//构造函数的重载和方法的重载是一样的，只要提供不同的参数列表即可
class OverridInit {
    var width: Double = 0.0
    var height: Double = 0.0
    init() {        //构造函数一
        width = 666
        height = 666
    }
    init(width: Double, height: Double) {       //构造函数二
        self.width = width
        self.height = height
    }
    init(length: Double) {      //构造函数三
        width = length
        height = length
    }
}
//可以看出，上述三个构造函数的区别就是参数列表不同，函数名都是一样的
//调用的时候，你给的参数决定了调用哪个构造函数
//
//
//----------------------------------------------------------构造函数辨析----------------------------------------------------------
//ps：这里补充一个很重要的点，swift和c++在函数重载有一个很大的区别
//比如有一个函数get(width: Double, height: Double)
//c++调用的时候是这样的：get(100, 200)，调用的时候是没有参数标签的
//swift调用的时候是这样的：get(width: 100, height: 200)，调用的时候带上了参数标签
//所以swift分辨函数是不同的靠的是参数标签，而不是参数的数据类型，参数标签不同而参数类型相同的函数我们会视为函数重载，这在c++里是行不通的
//由于很多时候省略了参数标签，而是直接将参数名当做参数标签，所以更直观的是，参数名不同，函数就不同
//若是带上了参数标签，比如get(width: Double) 和 get(W width: Double)
//那么第一个函数的参数标签是width，而第二个是W，那么显然他们就是不同的函数，就构成了函数重载
//
//
//
//----------------------------------------------------------构造函数代理------------------------------------------------------------------
//构造函数多了，可能会造成代码重复，冗余，所以，重复的部分可以直接调用，比如构造函数一去调用二来实现部分属性的初始化
//这是结构体的构造函数代理，构造函数全为init
struct OverrideInitStruct {
    var width: Double = 0.0
    var height: Double = 0.0
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    init(W width: Double, H height: Double) {
        self.width = width
        self.height = height
    }
    init() {       //这个构造函数直接调用上面的构造函数进行初始化，省略了代码量
        self.init(width: 999, height: 999)
    }
}
//
//
//类构造函数横向代理
//类似于结构体的代理方式，但是不同的是，类称为“便利构造函数”
class OverrideInitClass {
    var width: Double = 0.0
    var height: Double = 0.0
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    init(W width: Double, H height: Double) {
        self.width = width
        self.height = height
    }
    convenience init() {       //可以看到，这个地方加了convenient，这就是类构造函数和结构体构造函数的区别了
        self.init(width: 999, height: 999)
    }
}
//
//
//
//----------------------------------------------------------析构函数------------------------------------------------------------------
//析构函数用来清除资源所用
//无参数，无返回值，不重载
//不同于c++，c++需要手动释放内存资源，但是swift不需要，swift的析构函数需要做一些其他的清除工作，比如关闭文件等
class denitFunc {
    var width: Double = 0.0
    init(width: Double) {
        self.width = width
    }
    deinit {
        print("denit succeed")
    }
}
var denitExample: denitFunc? = denitFunc(width: 55)
denitExample = nil     //赋值为nil的时候就会释放内存，也就会调用析构函数
//很重要的一点，赋值为nil是只有可选值才能进行的操作
//只有类才能进行析构
//注意，析构函数的调用在清空内存之前
