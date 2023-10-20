//
//  ApiStatement.swift
//  AppBank
//
//  Created by Pedro Henrique on 31/08/23.
//

import Foundation

enum ApiString {
    case urlStatement

    var valor: String {
        switch self {
        case .urlStatement:
            return "https://api-bank-iota.vercel.app/extrato"
        }
    }
}

class ApiStatement {
    private static let basePath = ApiString.urlStatement.valor
    
    
    class public func loadStatements(onComplete: @escaping ([StatementModel]) -> Void) {
        guard let url = URL(string: basePath) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error == nil {
                guard let response = response as? HTTPURLResponse else { return }
                if response.statusCode == 200{
                    
                    guard let data = data else{return}
                    do{
                        let statement = try JSONDecoder().decode([StatementModel].self, from: data)
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
}
