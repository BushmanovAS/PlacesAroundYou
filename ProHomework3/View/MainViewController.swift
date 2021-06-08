import UIKit
import Alamofire
import MapKit

class MainViewController: UIViewController {
    @IBOutlet weak var map: MKMapView!
    var viewModel = MainViewModel()
    var nameLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.updateLocation {
            self.viewModel.updatePlaces {
                self.mapSetup()
                print("OK <----------------------------")
            }
        }
    }
    
    @IBAction func cafeButton(_ sender: Any) {
        filterMap(name: PlacesType.cafe.rawValue)
    }
    
    @IBAction func coffeButton(_ sender: Any) {
        filterMap(name: PlacesType.coffe.rawValue)
    }
    
    @IBAction func teaButton(_ sender: Any) {
        filterMap(name: PlacesType.tea.rawValue)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        map.removeAnnotations(viewModel.filteredAnnotations)
        map.addAnnotations(viewModel.annotations)
    }
    
}

// MARK: Ext. for map
extension MainViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        nameLabel.text = (view.annotation?.title)!
        nameLabel.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y + 20, width: 100, height: 20)
        nameLabel.sizeToFit()
        nameLabel.backgroundColor = .systemBlue
        map.addSubview(nameLabel)
        
        print(view.annotation?.title)
        print(view.frame)
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        nameLabel.removeFromSuperview()
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        viewModel.annotations.removeAll()
        viewModel.lat = mapView.centerCoordinate.latitude
        viewModel.lng = mapView.centerCoordinate.longitude
        viewModel.updatePlaces {
            self.map.addAnnotations(self.viewModel.annotations)
        }
        print(mapView.centerCoordinate)
    }
    
    func mapSetup() {
        
        guard let location = viewModel.userLocation else { return }
        
        let regionRadius: CLLocationDistance = 600
        let region = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        map.setRegion(region, animated: true)
        map.delegate = self
        map.addAnnotations(viewModel.annotations)
    }
    
    func filterMap(name: PlacesType.RawValue) {
        viewModel.filterAnnotations(name: name)
        map.removeAnnotations(viewModel.annotations)
        map.addAnnotations(viewModel.filteredAnnotations)
    }
}
