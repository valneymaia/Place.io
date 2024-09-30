
//  InfoView.swift
//  Place.io
//
//  Created by Turma02-Backup on 05/09/24.
//

import SwiftUI

struct InfoView: View {
    @ObservedObject var viewModel : ViewModel
    @State var p: Local?
    
    func calculaMedia(aval: [comenta]) -> Double {
        var avatotal = 0.0
        for a in aval{
            avatotal += a.umAval!
        }
        
        return avatotal / Double(aval.count)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                
                
                var media = calculaMedia(aval: p!.coment!)
                
                VStack{
                    VStack {
                        AsyncImage(url: URL(string: p!.foto!)){ result in
                            result.image?
                                .resizable()
                        }
                        .cornerRadius(10)
                        .frame(width: 300, height: 300)
                        .padding(.top)
                    }
                    VStack(alignment: .leading, spacing: 6) {
                        Text(p!.nomeLocal!)
                            .font(.title)
                        
                        HStack {
                            Text(p!.categoria!)
                                .bold()
                                .padding()
                            
                            
                            
                            HStack {
                                
                                Text("\(media)" + " / 5.0")
                                    .padding(.leading)
                                Image(systemName: "star.fill")
                                    .foregroundColor(.orange)
                                Text("\(p!.coment!.count)")
                                    .padding(.leading)
                                
                                
                            }
                        }
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "mappin.and.ellipse")
                                .font(.title3)
                                .foregroundColor(.orange)
                            Text(p!.endereco!)
                        }
                        Divider()
                    }
                    HStack {
                        Image(systemName: "info.bubble")
                            .foregroundColor(.orange)
                        Text(p!.descricao!)
                        Spacer()
                    }
                    Divider()
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.orange)
                        Text(p!.telefone!)
                        Spacer()
                    }
                    Divider()
                    
                    
                    ForEach(p!.horarioFuncionamento!, id: \.self){ p1 in
                        HStack {
                            Image(systemName: "calendar.badge.clock")
                                .font(.title3)
                                .foregroundColor(.orange)
                            ScrollView(.horizontal) {
                                VStack{
                                    HStack{
                                        Text(p1.dia1!)
                                        Spacer()
                                    }
                                    HStack{
                                        Text(p1.dia2!)
                                        Spacer()
                                    }
                                    HStack{
                                        Text(p1.dia3!)
                                        Spacer()
                                    }
                                    HStack{
                                        Text(p1.dia4!)
                                        Spacer()
                                    }
                                    HStack{
                                        Text(p1.dia5!)
                                        Spacer()
                                    }
                                    HStack{
                                        Text(p1.dia6!)
                                        Spacer()
                                    }
                                    HStack{
                                        Text(p1.dia7!)
                                        Spacer()
                                    }
                                    
                                }
                            }
                        }
                        Divider()
                    }
                    HStack{
                        NavigationLink(destination: CommentsView(lugar: p, viewModel: viewModel)) {
                            Text("Comentários / Avaliar")
                                .padding()
                        }
                        .padding(.top)
                        .padding(.leading, 80)
                        Spacer()
                    }
                    
                }.onAppear() {
                    viewModel.fetch()
                }.onChange(of: viewModel.chars,{
                    viewModel.fetch()
                })
            }
            
            // .padding(.leading)
        }
        
    }
}
//
//#Preview {
//    InfoView(p: Local(_id: nil, _rev: nil, nomeLocal: "teste", horarioFuncionamento: [dia(dia1: "", dia2: "", dia3: "", dia4: "", dia5: "", dia6: "", dia7: "")], endereco: "", descricao: "", latitude: "", longitude: "", telefone: "", foto: "", categoria: ""))
//}
