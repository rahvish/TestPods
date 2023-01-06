

import UIKit
import Foundation
import SwiftUI

struct Food:Identifiable,Decodable{
    var id:Int
    var uid:String
    var dish:String
    var description:String
    var indgredient:String
    var measurement:String
}


class ViewController: UIViewController {
    
    let network = Network()


    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        func getRandomFood() async throws {
            
            guard let url = URL(string: "https://random-data-api.com/api/food/random_food") else{fatalError("missing URL")}
            let urlRequest = URLRequest(url: url)
            let (data,response) = try await  URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else{fatalError("error while fetching data")}
            let decodedFood = try JSONDecoder().decode(Food.self, from: data)
            print("Async DecodedFood",decodedFood)
            
        }
            .task {
                    do {
                            try await network.getRandomFood()
                    } catch {
                            print("Error", error)
                    }
            }
        
    }

}

