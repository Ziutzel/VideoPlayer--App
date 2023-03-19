//
//  ViewController.swift
//  videoPlayerCollection
//
//  Created by Ziutzel grajales on 16/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var categorySegmented: UISegmentedControl!
    
    @IBOutlet weak var videoCollection: UICollectionView!
    
    @IBOutlet weak var videosName: UILabel!
    
    let manager = VideoManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //Segmented Control
        
     getVideos(category: "playa")
     
        //videoCollection.delegate = self
      //  videoCollection.data
    }

    func getVideos (category: String) {
        
        Task {
            await manager.findVideos(topic: category)
        }
    }

    @IBAction func categorySegmentedAction(_ sender: UISegmentedControl) {
}
    
    
    @IBAction func searchButton(_ sender: UIButton) {
    }
    
}

