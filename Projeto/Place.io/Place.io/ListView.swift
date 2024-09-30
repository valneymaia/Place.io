//
//  ListView.swift
//  Place.io
//
//  Created by Turma02-Backup on 05/09/24.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = ViewModel()
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                   
                    ForEach(searchResults, id: \.self) { local in
                        NavigationLink(destination:  InfoView(viewModel: viewModel, p: local)) {
                            HStack{
                                AsyncImage(url: URL(string: local.foto!)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame( width: 100, height: 100)
                                .cornerRadius(10)
                                
                                Spacer()
                                
                                VStack{
                                    Text(local.nomeLocal!)
                                        .bold()
                                    Text(local.endereco!)
                                    
                                }
                            }
                            .padding()
                            .background(Color.cinzinha)
                            .cornerRadius(10)
                            .shadow(radius: 4)
                            .frame(maxWidth: 350)
                            .foregroundStyle(.black)
                            
                        }
                        Spacer(minLength: 40)
                    }
                    
                }
                .onAppear() {
                    viewModel.fetch()
                }
            }
        }
        .searchable(text: $searchText)
    }
    var searchResults: [Local] {
            if searchText.isEmpty {
                return viewModel.chars
            } else {
                return viewModel.chars.filter { $0.nomeLocal!.contains(searchText) }
            }
        }
}

#Preview {
    ListView()
}
