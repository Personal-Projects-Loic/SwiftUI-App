import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -150)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text("Perros-Guirec")
                    .font(.title)
                    .fontWeight(.bold)
                HStack(alignment: .center) {
                    Text("City in France")
                        .font(.subheadline)
                    Spacer()
                    Text("22540")
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                    Text("About Turtle Rock")
                        .font(.title2)
                    Text("Descriptive text goes here.")
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
