import UIKit
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addTwoNumbers()
        
//        travel(){
//            print("I'm driving in my car")
//        }
        
    }
//    jvuuutcutcucu
    func addTwoNumbers() {
        print("Step 1")
        
        // Normal Closure
        performSumFor(10, andSecodNumber: 20) { (result) in
            print("Result == \(result)")
        }
        // trailing
        self.trailingMethod{
            print("trail print2")
        }
          //autoclosure
        self.autoFunc(action: print("auto print without{}"))
        
        //auto parameters
        self.autoParameters(pred: 2>1)
        print("Last Step")
    }
    func performSumFor(_ num1: Int, andSecodNumber num2:Int, completionHandler: @escaping (_ resilt:Int) -> Void) {
        print("Step 2")
        let result = num1 + num2
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            print("Step 3")
            
            completionHandler(result)
        }
    }
    
    func trailingMethod(action: () -> Void) {
        print("trail print1.")
        action()
        print("trail print3!")
    }
    
    
    func autoFunc(action: @autoclosure() -> Void ){
         
            print("auto print1")
      
        action()
        
    }
    
    func autoParameters(pred: @autoclosure() -> Bool){
        if pred(){
            print("printing autoclosure with parameters")
        }
            
    }
    
    

    
}



