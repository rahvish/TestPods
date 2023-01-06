import UIKit

var greeting = "Hello, playground"

protocol example1
{
    func case1()
    func case2()
}

protocol example2
{
    func method1()
    func method2()
    func method3()
    func method4()
    func method5()
    func method6(Name: String)
}

extension example2 {
    func method2() {
        print("Done")
    }
    func method3(){
    }
    func method4(){
        
    }
    func method5(){
        
    }
}


// Mark optional protocols method type 2 with Objc
@objc protocol example3
{
    func secene1()
    @objc optional func secene2()
    func secene3()
    @objc optional func secene4()
    @objc optional func secene5()
}


class testResultsMethod1: example3 {
    func secene3() {
        print("secene3 Done")
        debugPrint("secene3 Done")
    }
    
    func secene1() {
        print("secene1 Done")
    }
    func secene2() {
        print("secene2 Done")
    }
}

class testResults: example2 {
    func method6(Name: String) {
        let Name = ""
        print(Name)
    }
    
    func method1() {
        print("method1 Done")
    }
    func method3() {
//        print("method3 Done")
//        print("13")
//        debugPrint("15" + " 15")
    
    }
    func method2() {
//        print("method2 Done")
//        debugPrint("Hello, playground method2 Done" + " method2 Done secene2 Done secene3 Done secene3 Done")
        print(13)
        let a = 9 * 9   ``aq1zsw2xde4
        print(15 * 15)
        debugPrint(15 * 15)
        debugPrint(13)
    }

}
print(greeting)
let trclass = testResults()
testResults().method2()
testResults().method4()
testResults().method3()


let tRm1 = testResultsMethod1()
testResultsMethod1().secene2()
testResultsMethod1().secene3()


