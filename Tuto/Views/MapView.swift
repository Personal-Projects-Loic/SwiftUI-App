
import SwiftUI
import MapKit


struct MapView: View {
    
    private var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 48.700, longitude: -3.45),
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
    }
    
    var body: some View {
        Map(initialPosition: .region(region))
    }
}



#Preview {
    MapView()
}
