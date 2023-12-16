//
//  ApiStatement.swift
//  AppBank
//
//  Created by Pedro Henrique on 31/08/23.
//

import Foundation

enum ApiString {
    case urlStatement
    
    var urlExtract: String {
        switch self {
        case .urlStatement:
            return "https://api-bank-iota.vercel.app/extrato"
        }
    }
}

protocol ApiStatementing {
    func loadStatements(onComplete: @escaping (ExtractsModel) -> Void)
}

class ApiStatement: ApiStatementing {
    private let basePath = ApiString.urlStatement.urlExtract
    static let serviceGetExtract = ApiStatement()
    
    func loadStatements(onComplete: @escaping (ExtractsModel) -> Void) {
        guard let url = URL(string: basePath) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200{
                    
                    guard let data = data else{return}
                    do{
                        let statement = try JSONDecoder().decode(ExtractsModel.self, from: data)
                        onComplete(statement)
                    } catch {
                        print(error.localizedDescription)
                    }
                }else{
                    print("Algum status inválido pelo servidor!!")
                }
                
            }else{
                print(error!)
            }
        }
        dataTask.resume()
    }
    
    func updateStatements(extractInformations: ExtratcModel, onComplete: @escaping (Bool) -> Void) {
        guard let url = URL(string: basePath) else {
            onComplete(false)
            return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            "type": 1,
            "about": extractInformations.about,
            "amount": extractInformations.amount,
            "date": "15 de Dezembro"
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        let task = URLSession.shared.dataTask(with: request) { date, response, error in
            if error == nil {
                onComplete(true)
            } else {
                onComplete(false)
            }
        }
        task.resume()
    }
    
}
