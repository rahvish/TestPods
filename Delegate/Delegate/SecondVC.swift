 
import UIKit
import Foundation
//
//protocol passingData{
//    func passData(str:String)
//}

class SecondVC: UIViewController {
 
    var dataOne = ""
    var delegate : ViewController!
    
    @IBOutlet weak var secondText:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondText.text = dataOne
         
    }
    
 
    @IBAction func secondButton(_ sender: Any) {
        delegate.passData(str: secondText.text!)
        navigationController?.popToRootViewController(animated: true)
    }
    
}
