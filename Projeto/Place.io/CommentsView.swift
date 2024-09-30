//
//  CommentsView.swift
//  Place.io
//
//  Created by Turma02-Backup on 05/09/24.
//

import SwiftUI

struct CommentsView: View {
    
    @State var mostrarSheet = false
    @State var lugar : Local?
    @ObservedObject var viewModel : ViewModel
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack{
                    // Spacer()
                    HStack {
                        Spacer()
                        Text("Digite seu comentário")
                        
                        Spacer()
                        
                        //
                        //                        NavigationLink(destination: AvaliationView(lcl: lugar!, viewModel: viewModel), label: {
                        //                            Image(systemName: "plus.message")
                        //                                .frame(width:70,height: 70)
                        //                                .background(.clarinho)
                        //                                .foregroundStyle(.black)
                        //                                .cornerRadius(10.0)
                        //                                .padding(30)
                        //                        })
                        
                        Button {
                            mostrarSheet.toggle()
                        }label: {
                            Image(systemName: "plus.message")
                                .frame(width:70,height: 70)
                                .background(.clarinho)
                                .foregroundStyle(.black)
                                .cornerRadius(10.0)
                                .padding(30)
                        }
                        .sheet(isPresented: $mostrarSheet, onDismiss: {
                            viewModel.fetch()
                        }) {
                            AvaliationView(lcl: lugar!, viewModel: viewModel)
                        }
                        
                        
                    }
                    .frame(width: 400,height: 90)
                    .background(.cinzinha)
                    
                    
                    //ForEach(lugar!.coment!, id: \.self) { cmt in
                    ForEach(Array(viewModel.chars.filter{$0.nomeLocal == lugar?.nomeLocal})[0].coment!, id: \.self) { cmt in
                        HStack {
                            Image(systemName:"person")
                                .resizable()
                                .frame(width:30,height:30)
                                .padding()
                            Text("\(cmt.comentario!)")
                                .font(.subheadline)
                                .bold()
                                .padding(5)
                            Spacer()
                            var ava = String(format: "%.1f / 5.0", cmt.umAval!)
                            Text(ava)
                                .font(.subheadline)
                                .bold()
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                                .padding()
                        }
                        
                    }
                    
                    
                    
                }
                .onAppear {
                    viewModel.fetch()
                    
                }
            }
            Spacer()
        }
    }
}

//#Preview {
//    CommentsView(local: "Barbearia Macho com Estilo")
//}

