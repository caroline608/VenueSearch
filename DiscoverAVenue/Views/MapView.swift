//
//  MapView.swift
//  DiscoverAVenue
//
//  Created by Richard Crichlow on 1/18/18.
//  Copyright © 2018 Caroline Cruz. All rights reserved.
//

import UIKit
import MapKit

class MapView: UIView {
    
    lazy var locationSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.barTintColor = UIColor.groupTableViewBackground
        searchBar.placeholder = "Enter location"
        return searchBar
    }()
    
    lazy var venuesMapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    
    lazy var venuesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(VenueCollectionViewCell.self, forCellWithReuseIdentifier: "Venue Cell")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupLocationSearchBar()
        setupVenuesMapView()
        setupVenuesCollectionView()
    }
    
    private func setupLocationSearchBar() {
        addSubview(locationSearchBar)
        locationSearchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            locationSearchBar.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            locationSearchBar.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
            ])
    }
    
    private func setupVenuesMapView() {
        addSubview(venuesMapView)
        venuesMapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            venuesMapView.topAnchor.constraint(equalTo: locationSearchBar.bottomAnchor),
            venuesMapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            venuesMapView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            venuesMapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    private func setupVenuesCollectionView() {
        addSubview(venuesCollectionView)
        venuesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            venuesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            venuesCollectionView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            venuesCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2),
            venuesCollectionView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
            ])
    }
    
}
