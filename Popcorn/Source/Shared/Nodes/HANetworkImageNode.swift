//
//  HANetworkImageNode.swift
//  Farlist
//
//  Created by Hashem Aboonajmi on 8/4/17.
//  Copyright © 2017 Farlist. All rights reserved.
//


import AsyncDisplayKit

class HANetworkImageNode: ASNetworkImageNode
{
    required init(url: URL? = nil)
    {
        super.init(cache: nil, downloader: ASBasicImageDownloader.shared())
        placeholderEnabled = true
        placeholderFadeDuration = 0.25
        contentMode = .scaleAspectFill
        self.url = url as URL?
    }
}

