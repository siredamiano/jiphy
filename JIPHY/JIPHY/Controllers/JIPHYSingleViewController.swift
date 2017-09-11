//
//  JIPHYSingleViewController.swift
//  JIPHY
//
//  Created by Damian A Torres on 9/11/17.
//  Copyright © 2017 Damian A Torres. All rights reserved.
//

import UIKit
import FLAnimatedImage
import SDWebImage

class JIPHYSingleViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: FLAnimatedImageView!
    
    var gif: GIF!

    override func viewDidLoad() {
        super.viewDidLoad()
        paintInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

private extension JIPHYSingleViewController {
    
    func paintInterface() {
        let gifURL: URL = gif.images.fixedWidth!.url
        gifImageView.sd_setImage(with: gifURL, completed: nil)
    }
    
}
