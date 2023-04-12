//
//  APIService.swift
//  FANYI
//
//  Created by Алексей  on 12.04.2023.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    
    func fetch(input: String, completion: @escaping (String) -> Void) {
        let apiKey = "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"
        let baseURL = URL(string: "https://api.openai.com/v1/chat/completions")
        let messageParameters = ["role": "user", "content": input]
        let parameters = [
            "model": "gpt-3.5-turbo",
            "messages": [messageParameters],
            "temperature": 0.7
        ] as [String : Any]
        
        
        var urlRequest = URLRequest(url: baseURL!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: parameters)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription)
                return
            }
            let result = String(data: data, encoding: .utf8)
            print(result)
            let dataReceive = try! JSONDecoder().decode(ResponseData.self, from: data)
            completion(dataReceive.choices.first!.message.content)
        }
        .resume()
    }
    
    
    
}


struct ResponseData: Decodable {
    let choices: [MessageStruct]
}

struct MessageStruct: Decodable {
    let message: AnswerStruct
}

struct AnswerStruct: Decodable {
    let content: String
}


