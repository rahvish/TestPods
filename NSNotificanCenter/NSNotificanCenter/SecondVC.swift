

import UIKit

class SecondVC: UIViewController {
    @IBOutlet weak var userName :UITextField!
    @IBOutlet weak var ageTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func passData(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
//        navigationController?.popViewController(animated: true)
        var info = [String: String]()
        info["Name"] = userName.text
        info["Age"] = ageTF.text
        
        
        
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationKey), object: nil, userInfo: info)
    }
    


}
