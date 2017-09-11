//
//  JIPHYViewController.swift
//  JIPHY
//
//  Created by Damian A Torres on 9/10/17.
//  Copyright © 2017 Damian A Torres. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

fileprivate let reuseIdentifier = "GIFCell"
fileprivate let itemsPerRow: CGFloat = 2
fileprivate let sectionInsets = UIEdgeInsets(top: 0, left: 20.0, bottom: 0, right: 20.0)


class JIPHYViewController: UIViewController {
    @IBOutlet weak var jiphySearchBar: UISearchBar!
    @IBOutlet weak var jiphyCollectionView: UICollectionView!
    
    fileprivate var gifsList = [GIF]() {
        didSet {
            self.jiphyCollectionView?.reloadData()
        }
    }
    fileprivate var request: AnyObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        listTrendingGIFS()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

private extension JIPHYViewController {
    
    func listTrendingGIFS(){
        let trendingResource = TrendingResource()
        let trendingRequest = APIRequest(resource: trendingResource)
        request = trendingRequest
        trendingRequest.load { [weak self](gifs: [GIF]?) in
            self?.gifsList = gifs!
        }
    }
    
    func gifForIndexPath(indexPath: IndexPath) -> GIF {
        return gifsList[indexPath.row]
    }
    

    
}

extension JIPHYViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! JIPHYCollectionViewCell
        
        let theGif: GIF = gifForIndexPath(indexPath: indexPath)
        let gifURL: URL = theGif.images.fixedHeightSmall!.url
        let height = theGif.images.fixedHeightSmall?.height
        cell.gifImageView.sd_setImage(with: gifURL, completed: nil)
        cell.gifImageView.snp.makeConstraints { (make) in
            make.height.equalTo(height!)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension JIPHYViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let theGif: GIF = gifForIndexPath(indexPath: indexPath)
        let height = theGif.images.fixedHeightSmall?.height
    
        return CGSize(width: widthPerItem , height: CGFloat(height!))
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

extension JIPHYViewController: UITextFieldDelegate {

}


