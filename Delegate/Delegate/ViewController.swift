
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func buttonDelegate(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC
        vc?.dataOne = textField.text!
        vc?.delegate = self
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}
extension ViewController{
    func passData(str: String){
        textField.text = str
    }
}
