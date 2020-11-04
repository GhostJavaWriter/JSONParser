//
//  DetailViewController.swift
//  ParseJSON
//
//  Created by Баир Надцалов on 03.11.2020.
//

import UIKit

class DetailViewController: UIViewController {
    
    var postId        : Int?
    var text          : String?
    var author        : String?
    var commentsCount : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Post id: \(postId ?? 0)"

        setView()
    }
    
    func setView() {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let viewContainer = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        viewContainer.backgroundColor = .white
        view.addSubview(viewContainer)
        
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = text ?? "default"
        textView.font = UIFont(name: "arial", size: 18)
        viewContainer.addSubview(textView)
        
        let footer = UILabel()
        footer.translatesAutoresizingMaskIntoConstraints = false
        footer.numberOfLines = 2
        footer.text = "Author: \(author ?? "unknown")\nComments: \(commentsCount ?? 0)"
        viewContainer.addSubview(footer)
        
        NSLayoutConstraint.activate([
            
            textView.widthAnchor.constraint(equalTo: viewContainer.widthAnchor),
            textView.heightAnchor.constraint(equalTo: viewContainer.heightAnchor, multiplier: 0.9),
            textView.topAnchor.constraint(equalTo: viewContainer.topAnchor),
            textView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            
            footer.widthAnchor.constraint(equalTo: viewContainer.widthAnchor),
            footer.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            footer.topAnchor.constraint(equalTo: textView.bottomAnchor)
        
        ])
    }

}
