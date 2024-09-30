import MapKit
import SwiftUI

struct MapView: View {
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -7.23718, longitude: -39.3222),
        span: MKCoordinateSpan(latitudeDelta: 0.07, longitudeDelta: 0.07)
    ))
    @State var localQ: String = ""
    @StateObject var viewModel = ViewModel()
    @State private var filterV = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(position: $position) {
                    ForEach(stack, id: \.self) { location in
                        var latitude = location.latitude ?? "1.0"
                        var longitude = location.longitude ?? "1.0"
                        var latitudeD = Double(latitude) ?? 1.0
                        var longitudeD = Double(longitude) ?? 1.0
                        
                        Annotation(location.nomeLocal!,coordinate: CLLocationCoordinate2D(latitude:latitudeD, longitude:longitudeD)){
                            NavigationLink(destination: InfoView(viewModel: viewModel, p: location)) {
                                ZStack {
                                    if(location.save != 1){
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.red)
                                        Image(systemName: "mappin")
                                    }else{
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(Color.teal)
                                        Image(systemName: "mappin")
                                    }
                                    
                                }
                            }
                        }
                    }
                }
                HStack{
                    Spacer()
                    VStack{
                        Menu {
                            Button("Restaurante", action: restaurante)
                            Button("Ponto turístico", action: pontoT)
                            Button("sem Filtro", action: nofiltro)
                        } label: {
Image(systemName: "line.3.horizontal.decrease.circle.fill")
.resizable()
.foregroundStyle(Color.orange)
.frame(width: 50, height: 50)
.padding()
                        }
                        Spacer()
                    }
                }
            }
            .onAppear(){
                viewModel.fetch()
            }
        }
    }
    
    func restaurante(){
        filterV = "Restaurante"
    }
                                                                                                        
func pontoT(){
filterV = "Ponto turístico"
}
                                                                                                        
    func nofiltro(){
        filterV = ""
    }
            
            
        
        
        var stack: [Local] {
            if filterV.isEmpty {
                return viewModel.chars
            } else {
                return viewModel.chars.filter { $0.categoria!.contains(filterV) }
            }
        }
    }



#Preview {
    MapView()
}

