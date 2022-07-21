# 策略模式

标签（空格分隔）： 设计模式 Swift

---

[TOC]

面向对象的三大特性：封装、继承和多态，这三大特性其实为了方便代码的**复用**与**管理**。

## 需求一：设计鸭子模型

**需求：**设计一款简单的鸭子游戏，里面鸭子可以进行嘎嘎叫（quack）以及游泳（swim），还需要一个能展示鸭子外观（display）的方法。

为了代码的复用（quack 以及 swim），设计一个超类 Duck，子类继承于 Duck，但是子类各自实现不同的部分（display）,标准的 OO 编程。

```swift
class Duck {
    func quack() { debugPrint("嘎嘎") }
    func swim() { debugPrint("游泳") }
    func display() { fatalError(" subclass implement ") }
}

class MallarDuck: Duck {
    override func display() { debugPrint( "Mallar Duck display" ) }
}

class RedHeadDuck: Duck {
    override func display() { debugPrint( "Red Head Duck display" ) }
}

```

### 延伸思考：鸭子类型能否使用接口或者协议来表示?

```
protocol DuckRepresentable {
    func quack()
    func swim()
    func display()
}

extension DuckRepresentable {
    func quack() { debugPrint("嘎嘎") }
    func swim() { debugPrint("游泳") }
}


class MallarDuck: DuckRepresentable {
    func display() { debugPrint( "Mallar Duck display" ) }
}

class RedHeadDuck: DuckRepresentable {
    func display() { debugPrint( "Red Head Duck display" ) }
}
```
得益于 Swift 协议扩展默认实现，可以复用 `quack` 以及 `swim` 代码。但在其他语言中（例如 Java），就需要为每个遵循 `DuckRepresentable` 接口的类型实现 `quack`、`swim` 以及 `display` 方法，代码得不到复用。

--- 

## 需求二：让鸭子能飞吧

**需求：** 项目迭代，需要给鸭子添加飞行的能力。同时需要增加一种橡皮鸭（RubberDuck），这种鸭子发出吱吱叫声，但是不能飞。

需求需要鸭子会飞，因此在父类 Duck 中 `fly()` 方法即可。橡皮鸭重写 `quack()` 以及 `fly()`

```swift
class Duck {
    func quack() { debugPrint("嘎嘎") }
    func swim() { debugPrint("游泳") }
    func display() { fatalError(" subclass implement ") }
    func fly() { debugPrint( "飞行" ) }
}

class MallarDuck: Duck {
    override func display() { debugPrint( "Mallar Duck display" ) }
}

class RedHeadDuck: Duck {
    override func display() { debugPrint( "Red Head Duck display" ) }
}

class RubberDuck: Duck {
    override func quack() { debugPrint("吱吱") }
    override func display() { debugPrint( "Rubber Duck display" ) }
    override func fly() { /* 不能飞行 */ }
}

```

Great！完成了需求！下面来分析下这里面可能面临的问题：

1. 每增加一种行为需要检查所有的鸭子是否符合该行为;
2. 与父类行为不一致的代码无法进行复用;
3. 无法在运行时改变对应的行为;

采用继承的方式，都需要关注子类是否能够继承父类所有的行为，每添加一种行为，也必须检查**所有**子类是否符合这种行为，如果不符合，大多就是重写改行为（例如 fly 啥也不做）。但在理想情况下，**每一个子类对象仅仅需要关注只能能支持的行为，而不需要考虑自己不支持的行为**。当然可以让系统默认啥都不干，让子类进行关注自己的行为，但这同样引出了问题 3；如果多种鸭子有相同的行为且与父类默认行为不一致，此部分的代码就无法复用了。
问题 4 很明显，目前的类型无法在运行时动态改变。

### 延伸思考1：能否将 Fly 和 Quack 变化部分接口编程
每新增一种行为(例如 fly), 我们需要检查所有的子类是否符合该行为，那么能否用接口 flyable 接口，让拥有改行为的 Duck 遵循接口？

```
protocol Flyable {
    func fly()
}

protocol Quackable {
    func quack();
}

class Duck {
    func swim() { debugPrint("游泳") }
    func display() { fatalError(" subclass implement ") }
}

class MallarDuck: Duck, Flyable, Quackable {
    override func display() { debugPrint( "Mallar Duck display" ) }
    
    func quack() { debugPrint("嘎嘎") }
    func fly() { debugPrint( "Mallar Duck fly" ) }
}

class RedHeadDuck: Duck,Flyable, Quackable {
    override func display() { debugPrint( "Red Head Duck display" ) }
    
    func quack() { debugPrint("嘎嘎") }
    func fly() { debugPrint( "Red Head Duck fly" ) }
}

class RubberDuck: Duck, Quackable{
    override func display() { debugPrint( "Rubber Duck display" ) }    
    func quack() { debugPrint("吱吱") }
}

```
面向接口编程，虽然能解决掉问题 1, 但是问题 2 和 问题 3 依旧存在。

### 延伸思考2：继承 VS 组合

继承是在**编译期间**确定的**强耦合**的结构关系；
组合是在**运行期间**确定的**松耦合关系**，组合能够在运行时动态改变该行为。

同时在大多数语言中支持遵循多接口，但不支持遵循多继承（笔者目前就知道 C++支持多继承）。

---

## 整合鸭子行为

为了代码行为复用，我们将变化的部分（fly 以及 quack）提取出来，为了动态改变对应的行为，采用接口编程动态的改变行为。

```
protocol FlyBehavior {
    func fly()
}

class FlyNoWay: FlyBehavior {
    func fly() { debugPrint( "无法飞行") }
}

class FlyWithWings: FlyBehavior {
    func fly() { debugPrint( "可飞行 ") }
}

protocol QuackBehavior {
    func quack()
}

class MuteQuack: QuackBehavior {
    func quack() { debugPrint( "无法叫" ) }
}

class Squeak: QuackBehavior {
    func quack() { debugPrint( "嘎嘎" ) }
}

class Creak: QuackBehavior {
    func quack() { debugPrint( "吱吱" ) }
}

class Duck {
    
    var flyBehavior: FlyBehavior?
    var quackBehavior: QuackBehavior?
    
    func swim() { debugPrint("游泳") }
    func display() { }
    
    func makeFly() { flyBehavior?.fly() }
    func makeQuack() { quackBehavior?.quack() }
}

class MallarDuck: Duck {
    
    override init() {
        super.init()
        
        self.flyBehavior = FlyWithWings()
        self.quackBehavior = Squeak()
    }
    
    override func display() { debugPrint( "Mallar Duck display" ) }
}

class RedHeadDuck: Duck {
    
    override init() {
        super.init()
        
        self.flyBehavior = FlyWithWings()
        self.quackBehavior = Squeak()
    }
    
    override func display() { debugPrint( "Red Head Duck display" ) }
}

class RubberDuck: Duck {
    override init() {
        super.init()
        
        self.flyBehavior = FlyNoWay()
        self.quackBehavior = Creak()
    }
    
    // 动态改变行为
    func makeWing() {
        self.flyBehavior = FlyWithWings()
    }
    
    // 动态改变行为
    func makeBroken() {
        self.quackBehavior = MuteQuack()
    }
    
    override func display() { debugPrint( "Rubber Duck display" ) }

}


```

这里将 FlyBehavior 和 QuackBehavior 设计为接口，并未设计为一个类。这是因为接口更加灵活，设计为具体类后，以后想改变该类型需要强绑定为该类的子类，缺少灵活性。**尽量针对接口编程，而不是针对实现编程**

采用组合的方式将 FlyBehavior 和 QuackBehavior 联系起来，在运行时动态的去确定具体的类型。


## 策略模式

**定义：** 策略模式就是讲算法簇封装起来，然后让他们可以相互替换，并且可以再不同的场景中进行代码的复用。

在本例中，遵循 `FlyBehavior` 和 `QuackBehavior` 类似于定义的算法，然后在 RubberDuck 的 `makeWing` 和 `makeBreaken` 中动态的改变了 `flyBehavior` 和 `quackBehavior` 的行为。

上面的例子取自与 《Head First 设计模式》 第一章，主要将的就是策略模式。主要介绍了三大原则: 

+ 封装变化
+ 多用组合，少用继承
+ 针对接口编程，不针对实现编程




























