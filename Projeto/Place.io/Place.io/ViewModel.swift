//
//  ViewModel.swift
//  TesteAppdia
//
//  Created by Turma02-28 on 04/09/24.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var chars : [Local] = []
    
    func fetch(){
        
        print("😡")
        
        let task = URLSession.shared.dataTask(with: URL(string: "http://192.168.128.242:1880/read")!){data, _, error in
            do{
                self.chars = try JSONDecoder().decode([Local].self, from: data!)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    
    func updateData(local: Local) {
        guard let url = URL(string: "http://192.168.128.242:1880/update") else {
            print("URL inválida")
            return
        }
        
        print(local.save, local.nomeLocal)
        // Criar o objeto JSON a partir do modelo Local
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(local) else {
            print("Falha ao codificar o objeto Local")
            return
        }

        // Criar a solicitação
        var request = URLRequest(url: url)
        request.httpMethod = "PUT" // Ou "POST" se preferir
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        // Criar a tarefa de solicitação
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Verificar se ocorreu um erro
            if let error = error {
                print("Erro na solicitação: \(error.localizedDescription)")
                return
            }
            
            // Verificar o código de status HTTP
//            if let httpResponse = response as? HTTPURLResponse {
//                if httpResponse.statusCode == 200 {
//                    print("Dados enviados com sucesso!")
//                } else {
//                    print("Falha ao enviar dados. Código de status HTTP: \(httpResponse.statusCode)")
//                    
//                    if let responseData = data, let responseString = String(data: responseData, encoding: .utf8) {
//                        print("Resposta do servidor: \(responseString)")
//                    }
//                }
//            }
        }

        task.resume()
        //fetch()
    }

    
    func removeTopCard() {
            // Ensure the list is not empty
            guard !chars.isEmpty else { return }
            // Remove the top card
            chars.removeFirst()
        }
    
}
