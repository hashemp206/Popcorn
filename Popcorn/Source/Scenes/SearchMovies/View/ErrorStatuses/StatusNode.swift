//
//  StatusNode.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 3/31/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import AsyncDisplayKit
import AttributedLib

struct StatusModel {
    var image: UIImage
    var title: String
    var actionTitle: String?
    var action: (() -> Void)?
    
    init(title: String, image: UIImage, actionTitle: String? = nil, action: (() -> Void)? = nil) {
        
        self.title = title
        self.image = image
        self.actionTitle = actionTitle
        self.action = action
    }
}


class StatusNode: ASDisplayNode {
    private let iconNode = ASImageNode()
    private let titleNode = ASTextNode()
    private let buttonNode = ASButtonNode()
    
    private let status: StatusModel
    required init(status: StatusModel) {
        
        self.status = status
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = .backgroundColor
        
        iconNode.image = status.image
        iconNode.contentMode = .scaleAspectFit
        
        titleNode.attributedText = status.title.at.attributed {
            $0.foreground(color: .lightGray)
            .font(UIFont.boldSystemFont(ofSize: 30))
            .alignment(.center)
        }
        
        buttonNode.cornerRadius = 5
        buttonNode.borderColor = UIColor.lightGray.cgColor
        buttonNode.borderWidth = 1
        buttonNode.setAttributedTitle(status.actionTitle?.at.attributed {
            $0.foreground(color: .lightGray)
            .font(UIFont.systemFont(ofSize: 18))
        }, for: .normal)
        
        buttonNode.contentEdgeInsets = UIEdgeInsetsMake(4, 16, 4, 16)
        
        if let _ = status.action {
            
            // if any action is defined, we display buttonNode
            buttonNode.isHidden = false
            buttonNode.addTarget(self, action: #selector(actionButtonAction), forControlEvents: .touchUpInside)
        } else {
            buttonNode.isHidden = true
        }
        
    }
    
    @objc func actionButtonAction() {
        status.action?()
    }
    
    // MARK: Layout
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        iconNode.style.preferredSize = CGSize(width: 126, height: 126)
        return ASStackLayoutSpec(direction: .vertical, spacing: 16, justifyContent: .center, alignItems: .center, children: [iconNode, titleNode, buttonNode])
    }
}
