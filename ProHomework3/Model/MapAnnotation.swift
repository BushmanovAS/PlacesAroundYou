//
//  MapAnnotations.swift
//  ProHomework3
//
//  Created by Антон Бушманов on 28.05.2021.
//

import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }    
}


