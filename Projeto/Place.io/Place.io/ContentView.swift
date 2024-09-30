//
//  ContentView.swift
//  Place.io
//
//  Created by Turma02-Backup on 05/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
            VStack {
//                List(viewmodel.chars, id: \.self){ loc in
//                    Text("asdas")
//                }
                TabView{
                    
                    MapView()
                    .tabItem {
                        Label("Map", systemImage: "map")
                        }
                    
                        TinderView()
                        .tabItem {
                            Label("Tinder", systemImage: "rectangle.portrait.and.arrow.forward.fill")
                          }
                    
                    ListView()
                    .tabItem {
                        Label("List", systemImage: "magnifyingglass") }
                    
                    
                    
                  
                    
                  
                }
                .tint(.orange)
                .onAppear() {
                                 UITabBar.appearance().backgroundColor = UIColor(.white)
                        }

            }
            .onAppear() {
                viewModel.fetch()
            }
        }
}

#Preview {
    ContentView()
}
