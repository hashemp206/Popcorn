//
//  SuggestionsNode.swift
//  Popcorn
//
//  Created by Hashem Aboonajmi on 4/1/18.
//  Copyright © 2018 Hashem Aboonajmi. All rights reserved.
//

import AsyncDisplayKit

private class SuggestionNode: ASControlNode {
    
    private let borderNode = ASDisplayNode.BorderNode()
    private let textNode = ASTextNode()
    
    init(text: String) {
        super.init()
        automaticallyManagesSubnodes = true
        textNode.attributedText = text.at.attributed {
            $0.font(UIFont.systemFont(ofSize: 22))
            .foreground(color: .systemTintColor)
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let mainSpec = ASStackLayoutSpec(direction: .vertical, spacing: 10, justifyContent: .end, alignItems: .stretch, children: [textNode, borderNode])
        mainSpec.style.flexGrow = 1
       
        return mainSpec
    }
}

class SuggestionsNode: ASDisplayNode {

    var suggestions = [String]()
    {
        didSet {
            // clear old textNodes
            self.textNodes.removeAll()
            
            suggestions.forEach {
                let suggestionNode = SuggestionNode(text: $0)
                suggestionNode.addTarget(self, action: #selector(itemSelected(_:)), forControlEvents: .touchUpInside)
                
                self.textNodes.append(suggestionNode)
            }
            scrollNode.setNeedsLayout()
            scrollNode.layoutIfNeeded()
        }
    }
    
    private let headerNode = ASTextNode()
    private var textNodes = [SuggestionNode]()
    private let scrollNode = ASScrollNode()
    var onItemSelection: ((String) -> Void)?
    
    override init() {
        super.init()
        
        addSubnode(scrollNode)
        backgroundColor = .backgroundColor
        
        headerNode.attributedText = "Recent searches".at.attributed {
            $0.font(UIFont.systemFont(ofSize: 20, weight: .heavy))
        }
       
        scrollNode.automaticallyManagesContentSize = true
        scrollNode.automaticallyManagesSubnodes = true
        
        scrollNode.layoutSpecBlock = { [unowned self] (node, constrainedSize) in
            
            self.headerNode.style.spacingBefore = 28
            self.headerNode.style.spacingAfter = 14
            
            // set textNodes to have a fixed height
            self.textNodes.forEach { node in
                node.style.preferredSize = CGSize(width: 0, height: 48)
            }
            let mainSpec = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .stretch, children: [self.headerNode] + self.textNodes)
            
            return ASInsetLayoutSpec(insets: UIEdgeInsetsMake(0, 19, 0, 16), child: mainSpec)
        }
        
        // make scrollNode to always bounce vertically
        scrollNode.onDidLoad { node in
            let scrollView = (node.view as! UIScrollView)
            scrollView.keyboardDismissMode = .interactive
            scrollView.alwaysBounceVertical = true
        }
        
    }
    
    // MARK: Actions
    
    @objc func itemSelected(_ sender: ASControlNode)
    {
        let itemIndex = textNodes.index(of: sender as! SuggestionNode)!
        let item = suggestions[itemIndex]
        onItemSelection?(item)
    }
    
    // MARK: Layout
    
    override func layout() {
        super.layout()
        // manually set scrollNode frame
        scrollNode.frame = bounds
    }
    
}
