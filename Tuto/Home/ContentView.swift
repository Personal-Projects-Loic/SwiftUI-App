import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                CategoryHome()
                    .tabItem {
                        Label("Featured", systemImage: "star")
                    }
                
            
                LandmarkList()
                    .tabItem {
                        Label("List", systemImage: "list.bullet")
                    }
                
                AnimationPart()
                    .tabItem {
                        Label("Animation", systemImage: "light.max")
                    }
            }
        }
        
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
