import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                LandmarkList()
                
                NavigationLink(destination: AnimationPart()) {
                    Text("Animation app")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
