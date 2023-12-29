
// FILE USED TO FETCH INFOS IN THE JSON FILE
//      LOAD FUNCTION : take 1 argument of type T who's decodable (due to Codable protocol) and return T type
//      Error handling if file doesn't exists ect...

// Observable : optimisation, SwiftUI updates a view only when an observable property changes and the view’s body reads the property directly. I don't understant every thing but seems usefull

// ---------------------------------------------------------------------------------------

//                              NEW PART : ANIMATION

// NEW PART OF THE APP : I load the json file here... The function is made for...

// Dictionnary : is a container for storing key-value pairs. A key acts as a unique identifier for the value.

import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
