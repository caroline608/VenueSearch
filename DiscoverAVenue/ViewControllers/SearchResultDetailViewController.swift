//
//  SearchResultDetailViewController.swift
//  DiscoverAVenue
//
//  Created by Richard Crichlow on 1/18/18.
//  Copyright © 2018 Caroline Cruz. All rights reserved.
//

import UIKit

class SearchResultDetailViewController: UIViewController {

    
    let detailView = SearchResultDetailView()
    private var venue: Venue!
    init(venue: Venue, image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        //        set fellow
        self.venue = venue
        detailView.configureDetailView(venue: venue, image: image)
    }
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(detailView)
        //    setup dismiss button
        detailView.dismissModalButton.addTarget(self, action: #selector(dismissModalView), for: .touchUpInside)
        detailView.addButtonInContainerView.addTarget(self, action: #selector(addVenue), for: .touchUpInside)
    }
    
    
    @objc func dismissModalView() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func addVenue() {
    }
    
}

