//
//  MapViewController.swift
//  DiscoverAVenue
//
//  Created by Richard Crichlow on 1/18/18.
//  Copyright © 2018 Caroline Cruz. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    var venues = [Venue]() {
        didSet {
            for v in venues {
                print(v.name)
            }
        }
    }
    
    private let cellSpacing: CGFloat = 5.0
    
    lazy var venueSearchbBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for venue"
        return searchBar
    }()
    
    let mapView = MapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        venueSearchbBar.delegate = self
        mapView.locationSearchBar.delegate = self
        mapView.venuesCollectionView.dataSource = self
        mapView.venuesCollectionView.delegate = self
        configureNavigationBar()
        VenueAPIClient.manager.getVenues(with: 40.742919, and: -73.941664, completionHandler: { self.venues = $0 }, errorHandler: { print($0) })
    }
    
    func configureNavigationBar() {
        if let mapViewNavBar = navigationController {
            mapViewNavBar.navigationBar.barTintColor = UIColor.groupTableViewBackground
        }
        // https://www.youtube.com/watch?v=yx-ImzbNx8E
        // reference for adding searchbar to top navigation bar
        self.navigationItem.titleView = venueSearchbBar
        // add bar button to top right of navigation bar
        let showVenuesTableViewBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "database"), style: .plain, target: self, action: #selector(showVenuesTableView))
        self.navigationItem.rightBarButtonItem = showVenuesTableViewBarButton
    }
    
    @objc func showVenuesTableView() {
        // TODO: segue to list of venues in table view
    }
    
}

extension MapViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // TODO: implement delegate methods
    }
    
}

extension MapViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let venueCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Venue Cell", for: indexPath) as! VenueCollectionViewCell
        return venueCell
    }
    
}

extension MapViewController: UICollectionViewDelegate { }

extension MapViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewHeight = mapView.venuesCollectionView.bounds.height
        return CGSize(width: collectionViewHeight * 0.9, height: collectionViewHeight * 0.9)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: cellSpacing, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
}
