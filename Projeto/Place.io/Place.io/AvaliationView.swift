//
//  AvaliationView.swift
//  Place.io
//
//  Created by Turma02-7 on 09/09/24.
//

import SwiftUI

struct AvaliationView: View {
    
    @ObservedObject var estrelas = RatingViewModel()
    @State private var coment: String = ""
    @Environment(\.dismiss) private var dismiss
    @State var lcl : Local
    @ObservedObject var viewModel : ViewModel
  
    @State var stack: [Local] = []
    
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Avalie")
                .font(.title)
                .padding()
            //estrelas.ratingModel.rating utilizar esta variável para puxar o rating
            HStack {
                ForEach(1...5, id: \.self) { index in
                        RatingButton(viewModel: estrelas, index: index)
                }
            }
            .padding()
            TextField("Comente sua experiência", text: $coment)
                .multilineTextAlignment(.center)
                .frame(width: 350, height: 100)
                .background(.orange)
                .cornerRadius(33)
            
//            var comentario: String?
//            var nome: String?
//            var umAval: Double?
//            
            Button("Enviar") {
                
                var array = lcl.coment
                array!.append(comenta(comentario: coment, nome: "João", umAval: Double(estrelas.ratingModel.rating)))
                     
                print(array)
                
                var teste = Local(_id: lcl._id! , _rev: lcl._rev!, nomeLocal: lcl.nomeLocal!, horarioFuncionamento: lcl.horarioFuncionamento!, endereco: lcl.endereco!, descricao: lcl.descricao!, latitude: lcl.latitude!, longitude: lcl.longitude!, telefone: lcl.telefone, foto: lcl.foto, categoria: lcl.categoria, save: lcl.save, coment:  array, nava: (lcl.nava!) + 1)
                                    
                viewModel.updateData(local: teste)
                viewModel.fetch()
            }
            .padding()
            
            Spacer()
        }.onAppear(){
            viewModel.fetch()
            stack = viewModel.chars
            print(viewModel.chars)
            
        }.onDisappear(){
            print("HAHA")
            viewModel.fetch()
        }
    }
}

//#Preview {
//    AvaliationView(lcl: "Barbearia Macho com Estilo")
//}
