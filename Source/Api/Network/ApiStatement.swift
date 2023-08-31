//
//  ApiStatement.swift
//  Itubers
//
//  Created by Pedro Henrique on 31/08/23.
//

import Foundation

class ApiStatement {
    private static let basePath = "https://api-app-bank.vercel.app/extrato"
    
    
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
