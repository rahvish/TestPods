import UIKit
func example(_ perform_action: @autoclosure () -> Void) {
    
    print("I'm getting ready to go.")
    perform_action()
    print("I arrived!")
}

example(print("I'm driving in my car"))



print("==================------------------")

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel {
    print("I'm driving in my car")
}


