
//                              DIFFERENTS PROTOCOLS USED IN THIS STRUCT

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

//                              Identifiable : Protocol that Use the Identifiable protocol to provide a stable notion of                                                  identity to a class or value type

//                              - Guaranteed always unique, like UUIDs. (It's used to associate a unique ID to each element.

//                              Instead this : List(landmarks, id: \.id) { landmark in
//                              Use this : (with Identifiable Protocol) --> List(landmarks) { landmark in
//                              It's more easy
    
//                              -----------------------------------------------------

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case rivers = "Rivers"
        case lakes = "Lakes"
        case mountains = "Mountains"
    }
    
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

