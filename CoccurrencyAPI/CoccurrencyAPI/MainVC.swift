 
import UIKit
import Foundation

struct MyID: Codable {
    let id: Int?
    let dialogue, Private: Bool
    let tags: [String]
    let url: String?
    let favorites_count, upvotes_count, downvotes_count: Int?
    let author, author_permalink, body: String?
}
// Struct Model:

struct MyInfo: Decodable {
    let page: Int?
    let last_page: Bool?
    let quotes: [Quote]
//    enum CodingKeys: String, CodingKey {
//        case page
//        case lastPage = "last_page"
//        case quotes
//    }
}
//Quote Model:
struct Quote: Decodable {
    let tags: [String]?
    let favorite: Bool?
    let authorPermalink, body: String?
    let id, favoritesCount, upvotesCount, downvotesCount: Int?
    let dialogue: Bool?
    let author: String?
    let url: String?

//    enum CodingKeys: String, CodingKey {
//        case tags, favorite
//        case authorPermalink = "author_permalink"
//        case body, id
//        case favoritesCount = "favorites_count"
//        case upvotesCount = "upvotes_count"
//        case downvotesCount = "downvotes_count"
//        case dialogue, author, url
//    }
}

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAPI()
        getQuote()
    }
    func getAPI(){
        DispatchQueue.global(qos:.unspecified).async {
            sleep(3)
    
            let url = URL(string: "https://favqs.com/api/quotes")!
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("Token token=213ac516f960e6057dcbb1e270fc84e9" , forHTTPHeaderField: "Authorization")
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if data != nil && error == nil {
                    if let information = try? JSONDecoder().decode(MyInfo.self, from: data!) {
                        print(information)
                        
                        print(information.quotes.count)
                        
                    } else {
                        print("Invalid Response")
                    }
                    
                }
                
            }.resume()
        }
    }
    func getQuote(){
        let url = URL(string: "https://favqs.com/api/quotes/253")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Token token=213ac516f960e6057dcbb1e270fc84e9" , forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if data != nil && error == nil {
                if let information = try? JSONDecoder().decode(MyID.self, from: data!) {
                    print(information)
   
                } else {
                    print("Invalid Response")
                }
                
            }
            
        }.resume()    }
}
