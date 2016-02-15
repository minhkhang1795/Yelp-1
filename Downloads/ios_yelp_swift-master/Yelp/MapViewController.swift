//
//  MapViewController.swift
//  Yelp
//
//  Created by YouGotToFindWhatYouLove on 2/14/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var filteredBusinesses = [Business]()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        
        // set the region to display, this also sets a correct zoom level
        // set starting center location in San Francisco
        let centerLocation = CLLocation(latitude: 37.7833, longitude: -122.4167)
        goToLocation(centerLocation)
    }
    
    override func viewWillAppear(animated: Bool) {
        for business in filteredBusinesses {
            let coordinate = business.coordinate!
            print(coordinate["latitude"])
            let latitude = coordinate["latitude"]! as! Double
            let longitude = coordinate["longitude"]! as! Double
            
            let location = CLLocation(latitude: latitude, longitude: longitude)
            addAnnotationAtCoordinate(location.coordinate, title: business.name!, distance: business.distance!)
            
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(region, animated: false)
    }
    
    
    func addAnnotationAtCoordinate(coordinate: CLLocationCoordinate2D, title: String, distance: String) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = title
        annotation.subtitle = distance
        mapView.addAnnotation(annotation)
    }

    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "customAnnotationView"
        
        // custom pin annotation
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if (annotationView == nil) {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        else {
            annotationView!.annotation = annotation
        }
        if #available(iOS 9.0, *) {
            annotationView!.pinTintColor = UIColor.greenColor()
            annotationView!.animatesDrop = true
            annotationView!.canShowCallout = true
        } else {
            // Fallback on earlier versions
        }
        
        return annotationView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
