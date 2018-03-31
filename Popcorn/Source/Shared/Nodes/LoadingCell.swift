//
//  LoadingCell.swift
//  Fidilio
//
//  Created by Hashem Aboonajmi on 11/26/17.
//  Copyright © 2017 Fidilio. All rights reserved.
//

import AsyncDisplayKit

class LoadingCell: ASCellNode {
    

    private let loadingIndicator = ASDisplayNode { () -> UIView in
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func didEnterVisibleState() {
        super.didEnterVisibleState()
        (loadingIndicator.view as! UIActivityIndicatorView).startAnimating()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        loadingIndicator.style.preferredSize = CGSize(width: 100, height: 100)
        return ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: loadingIndicator)
    }
}


