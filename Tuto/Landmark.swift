
//                              Hashable : Protocol de comparaison entre deux valeurs
//                              Exemple  -->
 
//                              struct Employee: Hashable {
//                                  var name: String
//                              }

//                              let object1 = Employee(name: "Sabby")
//                              let object2 = Employee(name: "Smith")

//                              print(object1.hashValue)
//                              print(object2.hashValue)

//                              OUTPUT : 754256748862435114 AND -6408043519205941253

//                              -----------------------------------------------------

//                              Codable : Protocol de transformation de Data venant d'un JSON, XML...

//                              -----------------------------------------------------

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
        var image: Image {
            Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}

