import SwiftUI

struct TinderView: View {
    @State private var offset = CGSize.zero
    @State private var dragAmount = CGSize.zero
    @State private var swipeDirection: SwipeDirection?
    @StateObject var viewModel = ViewModel()
    
    enum SwipeDirection {
        case left, right, none
    }
    
    var body: some View {
        @State var stack: [Local] = viewModel.chars
        NavigationStack {
            ZStack {
                // Background Image and Information
                VStack {
                    Spacer()
                    
                    ZStack {
                        ForEach(stack.indices, id: \.self) { index in
                            if index == stack.indices.first {
                                ZStack {
                                    AsyncImage(url: URL(string: stack[index].foto!)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(height: 600)
                                    .cornerRadius(10)
                                    .padding()
                                    
                                    VStack {
                                        Spacer(minLength: 500)
                                        Text("\(stack[index].nomeLocal!)")
                                            .font(.title)
                                            .bold()
                                        Text("Description")
                                        Spacer()
                                    }
                                    .foregroundStyle(Color.white)
                                    .shadow(radius: 10)
                                }
                                .offset(x: offset.width + dragAmount.width, y: offset.height + dragAmount.height)
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            self.dragAmount = value.translation
                                        }
                                        .onEnded { value in
                                            withAnimation {
                                                if abs(value.translation.width) > 100 {
                                                    swipeDirection = value.translation.width > 0 ? .right : .left
                                                    self.offset.width += value.translation.width
                                                    
                                                
                                                    if(swipeDirection == .right){
                                                       
                                                        viewModel.chars[index].save = 2
                                                        viewModel.updateData(local: viewModel.chars[index])
                                                        
                                                       
                                                    }
                                                    
                                                    if(swipeDirection == .left){
                                                       
                                                        viewModel.chars[index].save = 1
                                                        viewModel.updateData(local: viewModel.chars[index])
                                                        
                                                       
                                                    }
                                                        stack.remove(at: index)
                                                    
                                    
                                                    viewModel.removeTopCard()
                                                    self.offset = .zero
                                                    self.dragAmount = .zero
                                                } else {
                                                    swipeDirection = .none
                                                    self.offset = .zero
                                                    self.dragAmount = .zero
                                                }
                                            }
                                        }
                                )
                                .animation(.spring(), value: offset)
                            }
                        }
                    }
                }
                
                // Swipe Indicator
                VStack {
                    Spacer()
                    ZStack {
                        Circle()
                            .foregroundStyle(Color.white)
                        
                        Image(systemName: swipeDirection == .right ? "checkmark" : swipeDirection == .left ? "xmark" : "hand.point.right.fill")
                            .resizable()
                            .padding()
                            .foregroundColor(swipeDirection == .right ? .green : swipeDirection == .left ? .red : .gray)
                    }
                    .frame(width: 75, height: 75)
                    Spacer(minLength: 520)
                }
            }
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}



#Preview {
    TinderView()
}
