

import UIKit

let notificationKey = "Hello"
class NSVC: UIViewController {
    @IBOutlet weak var notifyLbl: UILabel!
    @IBOutlet weak var secondVCButton: UIButton!
    @IBOutlet weak var dataLbl: UILabel!
    @IBOutlet weak var delegateText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondVCButton.layer.cornerRadius = 10
        NotificationCenter.default.addObserver(self, selector: #selector(doWhenNotifyied(_ :)), name: Notification.Name(notificationKey), object: nil)
        
       
    }
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func sendDataToLbl(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SecondSB", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SecondVC")
        navigationController?.pushViewController(vc, animated: true)

    }
    
    @objc func doWhenNotifyied(_ notification: NSNotification){
        notifyLbl.text = "Data Saved"
        
        if let dict = notification.userInfo as NSDictionary?{
            if let yourName = dict["Name"] as? String,
            let yourAge = dict["Age"] as? String {
                dataLbl.text = "hi \(yourName), your age is \(yourAge)years"
            }
        }
    }
    
    
    
    

}
