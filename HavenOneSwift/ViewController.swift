//
//  ViewController.swift
//  ONESwift
//
//  Created by 吴文海 on 2019/3/18.
//  Copyright © 2019 吴文海. All rights reserved.
//

import UIKit

//import HomeViewController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var v = 1 + 2
//        v = v + 5
//        print(v)
//        for x in 0...10 {
            // 添加空字符串参数换行
//            print("\(x) ", terminator: "")
//        }
        
        // 类型别名
//        typealias haven = Int
//        let a: haven = 999
//        print(a)
        
//        var str = "我的名字叫:"
//        str += "haven"
//        print("\(str)dfd","ssllklk")
        
//        let fullName = "First Last"
//        let fullNameArr = fullName.split(separator: " ")
//        print(fullNameArr)
        
    /** 数组
        
        // 1, 数组的创建方式
        // 创建方式1
        var arr = [Int]()
        // 创建方式2
        arr = [Int](repeating: 0, count: 5)
        // 创建方式3
        arr = [100, 100, 12]
        
        // 2. 数组的使用
        arr.append(10)
        arr.append(0)
        arr += [999]
        arr.insert(888, at: 3)
        arr.remove(at: 0)
        arr[0] = 1111
//        var val1 = arr[4]
        for item in arr {
            print(item)
        }
        
        for (index,value) in arr.enumerated() {
            print("index: \(index)","value: \(value)")
            if index == 3 {
                break
            }
        }
        print("数量: \(arr.count)")
 */
        
        /**
        // 字典
        // 字典的创建
        var someDict = [1 : "valeu1", 2 : "value2"]
        someDict.updateValue("valueUpdate", forKey: 1)
        someDict[2] = "haven"
        someDict.removeValue(forKey: 2)
        someDict[2] = nil
        let dictS: String = someDict[1]!
        print("\(someDict)",dictS)
        // 字典的遍历
        for (key,value) in someDict {
            print("key: \(key), value: \(value)")
        }
        
        let keys = someDict.keys
        let values = someDict.values
         
        */
        
    }

    
    // 函数
    func eat(site: String) -> String {
        return site
    }
    
    func eatAndRun(eat: String, run: String) {
        print(eat, run)
    }

    // 传一个或者多个参数
    func members<N>(mebers: N...) {
        for index in mebers {
            print("\(index) ", terminator: "")
        }
    }
    
    func calcDecrement(forDecrement total: Int) -> () -> Int {
        var overallDecrement = 0
        func decrementer() -> Int {
            overallDecrement -= total
            return overallDecrement
        }
        return decrementer
    }
    
    
    // 闭包
    // 有参数有返回值
    var  myClourse1 = {(a:Int, b:Int) -> Int in
        
        let str = "有参数有返回值"
        print(str)
        return a * b
    }
    // 无参数有返回值
    var myClourse2 = {() -> String in
        
        print("无参数有返回值")
        return "无参数有返回值"
    }

    // 无参数 无返回值
    let myClourse3 = {
        
        print("无参数无返回值闭包")
    }
    
    // 闭包作为函数参数
    func myOpreation(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
        
        let sun = a + b + operation(a, b)
        return sun
    }
    
    // 闭包捕获变量
    func counting() -> Int {
        var counter = 0
        let incrementCounter = {() -> Int in
            
            counter += 1
            return counter
        }
        return incrementCounter()
    }
    
    // 闭包应用
    //forEach
    func forEachYY() {

        let values = [1,2,3,4,5]
        values.forEach { (element) in
            print(element)
        }
    }
    
    
    
    func stringNum(str: String) -> Bool {
        
        return str.count < 5
    }

    
    // filter
    func filterYY() {
        
        var values = [1,2,3,4,5]
        
        values = values.filter { (element) -> Bool in
            
            return element > 3
        }
        
        print(values)
        var stringArray = ["12312312", "sdfsdfds", "112", "232423432", "dd"]
        stringArray = stringArray.filter({ (element) -> Bool in
            return element.count < 5
        })
        print(stringArray)
        
        var strS = ["ab", "bc", nil, "dd"]
        strS = strS.filter({ (element) -> Bool in
            
            return element != nil
        })
        
        print(strS)
    }
    
    // sorted
    func sortedYY() {
        
        var values = [11,23,2,40,5]
//        values = values.sorted();
        // 降序
        values = values.sorted { (s1, s2) -> Bool in
            return s1 > s2
        }
        
        // 升序
        values = values.sorted(by: { (s1, s2) -> Bool in
            
            return s1 < s2
        })
        // 数组字典排序
        let dict = ["1" : "a", "2" : "f", "3" : "b", "2.5" : "hf","25" : "f"];
//        let mDicts = dict.sorted(by: {$0.0 > $1.0})
        let mDicts = dict.sorted { (a, b) -> Bool in
            return a.value > b.value
        }
        
        print(mDicts)
    }
    
    // map 方法接受一个闭包作为参数， 然后它会遍历整个数组，并对数组中每一个元素执行闭包中定义的操作
    func mapYY() {
        
        let numbers  = [1, 3, 5,7]
//        let numbers1 = numbers.map({$0 + 1})
//        let numbers1 = numbers.map({"NO.\($0)"})
//        let numbers1 = numbers.map({$0 * 2})
//
//        let strS = ["ab", "bc", nil, "dd"]
//        let strs = strS.map { (element)
//            element != nil
//        }
//        print(numbers1)
//        print(strs)
    }
    
    func flatMap() {
        
    }
    
    
    // 拆包和封包
    func fb() {
        // 封包可以让某些情况值为nil 的时候不会奔溃, optional nil表示没有值, 例如在字典中取一个不存在的Key正常会崩溃, 如果封包情况下就不会
        // 显式封包
        let  optionalUrlStr: String? = "wuwenhai"
        print("my name is \(optionalUrlStr)")
        
        let optionalUrlstr2: String! = "wuwenhai2"
        print("my name is \(optionalUrlstr2)")
        
        // 强制拆包
        print("拆包 \(optionalUrlStr!)")
        
        let dict = ["name" : "wuwenhai", "number" : "1"]
        print("\(dict["name"]!)")
        print("\(dict["ss"])") // 此处如果进行强制拆包则会奔溃, 拆包的时候最好进行非空判断
        
        
    }
    
    func pushVc() {
        let homeVc = HomeViewController()
        homeVc.view.backgroundColor = .blue
        let navVc = UINavigationController.init(rootViewController: homeVc)
        self.present(navVc, animated: true, completion: nil)
    }
 
    @IBAction func clickButton(_ sender: UIButton) {
        
        // 函数调用
//        let eatResult = eat(site: "就知道吃")
//        print(eatResult)
//        eatAndRun(eat: "吃", run: "pao")
//        members(mebers: "12323dsf", "123","dsfsd")
        
//        let decrem = calcDecrement(forDecrement: 30)
//        print(decrem())
        
//        let ys = isY(10,1)
//        print(ys)

        /**
         * 闭包
         */
        // 有返回值有参数闭包
//        _ = myClourse1(10, 10)
        // 有返回值无参数闭包
//        _ = myClourse2()
        // 无参数无返回值闭包
//        myClourse3()
        
        // 闭包作为函数参数
//        print(myOpreation(a: 10, b: 10, operation: myClourse1))
        
        // 闭包捕获变量
//        print(counting())
        // 闭包应用
//        forEachYY()
//        filterYY()
//        sortedYY()
//        mapYY()
//        fb()
        pushVc()
    }
}


