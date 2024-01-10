# First Project in Swift.

**GOAL :** Improve Swift skills

# Documentation importante et notions apprises

## ModelData file

FILE USED TO FETCH INFOS IN THE JSON FILE
     LOAD FUNCTION : take 1 argument of type T who's decodable (due to Codable protocol) and return T type
     Error handling if file doesn't exists ect...

Observable : optimisation, SwiftUI updates a view only when an observable property changes and the view’s body reads the property directly. I don't understant every thing but seems usefull

---------------------------------------------------------------------------------------

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
}
```

Load function is one of those importants functions, it return a decodable T. It's like a JSON or XML
The function looks like a openFile C function. 
Using methods like JSONDecoder, and catch error in case of an error.

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

## Category row file :

.prefix : Returns a subsequence, up to the specified maximum length, containing the initial elements of the collection.
Exmeple : var tab [1, 2, 3, 4, 5]
          print(tab.prefix(2))
          --> [1, 2]


## Content View file

```swift
@State private var selection: Tab = .featured
```

@State: @State is a property wrapper in SwiftUI that is used to declare a state property. State properties are used to store and manage the mutable state of a view. When the state changes, SwiftUI automatically updates the view to reflect the new state.
private var selection: Tab: This declares a private variable named selection of type Tab. Tab is assumed to be an enum type, and it represents some kind of selection.
= .featured: This initializes the selection property with the default value of .featured. The . syntax suggests that featured is a case of an enum, and it is the initial value of the state variable.

Overall, this line of code is declaring a private state variable named selection of type Tab and initializing it with the default value of .featured. The @State property wrapper is used to indicate that changes to this state should trigger a re-render of the SwiftUI view that contains this property.

## Hike graph file

                            NEW PART : ANIMATION

---------------------------------------------------------------
Extension : Very usefull, in extension you can add methods, var... It's used to assign a value or a returned value to a name. for exemple :

```swift
extension UIColor {
    public class var lightBlue: UIColor {
        return UIColor(red: 205/255, green: 240/255, blue: 255/255, alpha: 1.0)
    }
}
```

Now, instead of using the expression : 
```swift
UIColor(red: 205/255, green: 240/255, blue: 255/255, alpha: 1.0).
```

I use : 

```swift
⭐️ UIColor.lightBlue ⭐️
```

It's more understandable and more easy.
 -------------------------------------------------------------- 

**This documentation is only to help me to remember how differents things works.**