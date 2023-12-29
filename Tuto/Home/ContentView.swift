import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                LandmarkList()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
