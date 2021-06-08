import MapKit

class MainViewModel {
    var venue: [Venue] = []
    var annotations: [MapAnnotation] = []
    var filteredAnnotations: [MapAnnotation] = []
    var userLocation: CLLocationCoordinate2D?
    var lat = 0.0
    var lng = 0.0
    
    func updatePlaces(completion: @escaping () -> Void) {
                
        PlacesLoader.loadPlaces(lat: lat, lng: lng) { (venue) in
            self.venue = venue
            
            for i in 0..<venue.count {
                let subtitle = venue[i].categories![0].name
                let name = venue[i].name
                var coodrinate = CLLocationCoordinate2D()
                coodrinate.latitude = (venue[i].location?.lat)!
                coodrinate.longitude = (venue[i].location?.lng)!
                let annotation = MapAnnotation(coordinate: coodrinate, title: name!, subtitle: subtitle!)
                self.annotations.append(annotation)
            }
            print("\(self.annotations[0].subtitle)<---------------")
            completion()
        }        
    }
    
    func updateLocation(completion: @escaping () -> Void) {
        let lm = LocationManager.shared
        
        lm.requestAccess { isSucces in
            
            if isSucces {
                
                lm.getLocation { location in
                    
                    guard let location2 = location else { return }
                    
                    self.userLocation = location2
                    self.lat = location2.latitude
                    self.lng = location2.longitude
                    print(location)
                    completion()
                }
            }
        }
    }

    
    func filterAnnotations(name: PlacesType.RawValue) {
        filteredAnnotations = annotations.filter { $0.subtitle == name }
    }
}
