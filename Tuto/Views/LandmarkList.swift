
// NavigationSplitView : Used as navigation in React.
// With this embeded fonction, i can create a sidebar, a view, a new content, and details.

// @State : same usage of a useState in react

// .filter : used in List object, usable with Idententifable protocol

// ForEach : is used to create differents views like loop with a condition :  filteredLandmarks

// Toggle : switch button, add a condition and change the state of showFavoritesOnly
// I use the $ prefix to access a binding to a state variable, or one of its properties.

// animation : Make something more smooth when button is hitted. Take Bool as arg

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
                .font(.title)
                .fontWeight(.semibold)
            
        }
    }
}

#Preview {
    LandmarkList()
}
