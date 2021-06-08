import Foundation
import Alamofire

class PlacesLoader {
        
    static func loadPlaces(lat: Double, lng: Double, completion: @escaping ([Venue]) -> Void) {
        let url =  "https://api.foursquare.com/v2/venues/explore?ll=\(lat),\(lng)&section=coffee&client_id=JLMXOP3VWT5E3WKUWG1MRD1OLTX0VNX1J5SLV205U3GAFVSS&client_secret=RDVGOPEJDXGMPZUESRFU3JT0IIY5NGX4CBFT0X1W3J4TNNCW&v=20180630"
        
        AF
            .request(url)
            .responseDecodable(of: Places.self) { (response) in
            
                guard let places = response.value else { return }
                
                let items = places.response?.groups![0].items
                var venue: [Venue] = []
                
                for i in 0..<items!.count {
                    venue.append(items![i].venue!)
                    print(venue[i].categories![0].name)
                }
                
                completion(venue)
        }        
    }
    
}
