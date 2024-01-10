# First Project in Swift.

**GOAL :** Improve Swift skills

# Documentation importante et notions apprises

## ModelData file

FILE USED TO FETCH INFOS IN THE JSON FILE
     LOAD FUNCTION : take 1 argument of type T who's decodable (due to Codable protocol) and return T type
     Error handling if file doesn't exists ect...

Observable : optimisation, SwiftUI updates a view only when an observable property changes and the view’s body reads the property directly. I don't understant every thing but seems usefull

---------------------------------------------------------------------------------------

                             NEW PART : ANIMATION

NEW PART OF THE APP : I load the json file here... The function is made for...

```swift
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
}```

Dictionnary : is a container for storing key-value pairs. A key acts as a unique identifier for the value.


## Landmark model and differents protocols


DIFFERENTS PROTOCOLS USED IN THIS STRUCT

Hashable : Protocol de comparaison entre deux valeurs
Exemple  --> 

```swift  
struct Employee: Hashable {
var name: String
}

let object1 = Employee(name: "Sabby")
let object2 = Employee(name: "Smith")

print(object1.hashValue)
print(object2.hashValue)
```

```bash
OUTPUT : 754256748862435114 AND -6408043519205941253
```

-----------------------------------------------------

Codable : Protocol de transformation de Data venant d'un JSON, XML...

-----------------------------------------------------

Identifiable : Protocol that Use the Identifiable protocol to provide a stable notion of                                                  identity to a class or value type

- Guaranteed always unique, like UUIDs. (It's used to associate a unique ID to each element.

Instead this : 

```swift
List(landmarks, id: \.id) { landmark in
    ....
}
``````
Use this : (with Identifiable Protocol) --> 

```swift
List(landmarks) { landmark in
    ...
}
```

It's more easy
    
-----------------------------------------------------

## Favourite button file 

⚠️ Difference between @State and @Binding :
- @State : is for internal data in a view.
- @Binding :  is for sharing data between views ⚠️

## Landmark List 

NavigationSplitView : Used as navigation in React.
With this embeded fonction, i can create a sidebar, a view, a new content, and details.

@State : same usage of a useState in react

.filter : used in List object, usable with Idententifable protocol

ForEach : is used to create differents views like loop with a condition :  filteredLandmarks

Toggle : switch button, add a condition and change the state of showFavoritesOnly
I use the $ prefix to access a binding to a state variable, or one of its properties.

animation : Make something more smooth when button is hitted. Take Bool as argument

@Environment is used to read core data, as the size, light or dark mode...

**This documentation is only to help me to remember how differents things works.**