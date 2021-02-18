//
//  AutoResizableImageView.swift
//  MemeMeV1
//
//  Created by Александр on 17.02.2021.
//

import UIKit

// This class automatically sets image Image view height to its image height

class AutoResizableImageView: UIImageView {

    override var intrinsicContentSize: CGSize {
        
        if let newImage = self.image {
            let newImageWidth = newImage.size.width
            let newImageHeight = newImage.size.height
            let newViewWidth = self.frame.size.width
            
            let ratio = newViewWidth/newImageWidth
            let scaledHeight = newImageHeight * ratio
            
            return CGSize(width: newViewWidth, height: scaledHeight)
        }
        
        return CGSize(width: -1.0, height: -1.0)
    }

}
