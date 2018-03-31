//
//  MovieNode.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/30/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import AsyncDisplayKit
import AttributedLib
class MovieNode: ASCellNode {

    private let titleNode = ASTextNode()
    private let dateNode = ASTextNode()
    private let descriptionNode = ASTextNode()
    private let posterNode: HANetworkImageNode
    private let borderNode = ASDisplayNode.BorderNode()
    
    init(movie: SearchMovies.Search.ViewModel.DisplayMovie) {
        
        posterNode = PosterNode(url: movie.posterURL)
        super.init()
        
        // cell automatically add subnode
        automaticallyManagesSubnodes = true
        
        // populating labels
        titleNode.attributedText = movie.title.at.attributed {
            $0.font(UIFont.systemFont(ofSize: 16, weight: .medium))
            .foreground(color: .textDark)
        }
        dateNode.attributedText = movie.releaseDate.at.attributed {
            $0.font(UIFont.systemFont(ofSize: 12))
            .foreground(color: .lightGray)
        }
        descriptionNode.attributedText = movie.description.at.attributed {
            $0.font(UIFont.systemFont(ofSize: 12))
            .foreground(color: .lightGray)
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        // constrain posterNode to a fixed size
        posterNode.style.preferredSize = CGSize(width: 73, height: 78)
        
        // for layouting nodes, Texture provides an alternative for UIKit Auto Layout, which is significantly faster
        // to layout nodes, Layout Api uses a declerative language similar to flexbox in CSS
        
        // imaging a row, in that row, titleNode and dateNode are positioned horiontally, and remaining space is between those nodes
        let titleDateSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .spaceBetween, alignItems: .end, children: [titleNode, dateNode])
        
        // for the left cloum which contains all the text nodes, they are positioned vertically and remaining space is distributed between them
        let leftColumnSpec = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .spaceBetween, alignItems: .stretch, children: [titleDateSpec, descriptionNode])
        leftColumnSpec.style.flexShrink = 1
        
        // now for the main spec, again imaging a row, nodes are positioned horizontally from the left side, and there is 16 point space between those children
        let mainSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 16, justifyContent: .start, alignItems: .start, children: [posterNode, leftColumnSpec])
        
        // finally we set an 16 point edge inset around main spec
        let mainSpecWithInset = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(16, 16, 16, 16), child: mainSpec)
        
        let mainSpecWithBorder = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .stretch, children: [mainSpecWithInset, borderNode])
        
        return mainSpecWithBorder
        
    }
}
