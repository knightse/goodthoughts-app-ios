//
//  MainView.swift
//  GoodThoughts
//
//  Created by Caine Simpson on 1/4/21.
//

import Foundation
import UIKit

//This view is building the ui with the return components shown below.
class MainView: UIView {
    var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var quoteLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var heartButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var authorLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let randomButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let libraryButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createHomeView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createHomeView()
    }
    
    func createHomeView() {
        addViews()
        setupViews()
    }
    
    
    func addViews() {
        self.addSubview(containerView)
        self.addSubview(titleLabel)
        self.addSubview(randomButton)
        self.addSubview(quoteLabel)
        self.addSubview(authorLabel)
        self.addSubview(heartButton)
        self.addSubview(shareButton)
        self.addSubview(libraryButton)
    }
    
    func setupViews() {
        setupButton()
        setupContainerView()
        setupTitleLabel()
        setupQuoteLabel()
        setupAuthorLabel()
        setupHeartButton()
        setupShareButton()
        setupLibraryButton()
    }
    
    func setupLibraryButton() {
        libraryButton.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        libraryButton.leftAnchor.constraint(equalTo: heartButton.leftAnchor, constant: 25).isActive = true
        libraryButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        libraryButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        if let libraryIcon = UIImage(systemName: "book.circle") {
            libraryButton.setImage(libraryIcon, for: .normal)
        }
        
        libraryButton.imageView?.contentMode = .scaleAspectFill
        libraryButton.imageEdgeInsets = UIEdgeInsets(top: 55, left: 55, bottom: 55, right: 55)
    }
    
    func setupShareButton() {
        shareButton.rightAnchor.constraint(equalTo: randomButton.leftAnchor, constant: -20).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        shareButton.topAnchor.constraint(equalTo: randomButton.topAnchor, constant: 0).isActive = true
        
        if let shareImage = UIImage(systemName: "square.and.arrow.up") {
            shareButton.setImage(shareImage, for: .normal)
        }
        
        shareButton.imageView?.contentMode = .scaleAspectFill
    }
    
    func setupHeartButton() {
        heartButton.leftAnchor.constraint(equalTo: randomButton.rightAnchor, constant: 20).isActive = true
        heartButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        heartButton.topAnchor.constraint(equalTo: randomButton.topAnchor, constant: 0).isActive = true
        heartButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
//        heartButton.backgroundColor = .systemBlue
//        heartButton.setImage("heart", for: .normal)
        if let heartImage = UIImage(systemName: "heart") {
            heartButton.setImage(heartImage, for: .normal)
        }
        
        heartButton.imageView?.contentMode = .scaleAspectFill
        
    }
    
    func setupAuthorLabel() {
        authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 20).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: quoteLabel.leftAnchor, constant: 10).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        authorLabel.widthAnchor.constraint(equalToConstant: 400).isActive = true
        authorLabel.text = "- Sorum Somsum"
        authorLabel.numberOfLines = 1
        authorLabel.font = UIFont(name: "Hiragino Mincho ProN W3", size: 18.0)
        authorLabel.textAlignment = .natural
        
    }
    
    func setupQuoteLabel() {
        quoteLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80).isActive = true
        quoteLabel.heightAnchor.constraint(equalToConstant: 280).isActive = true
        quoteLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        quoteLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -20).isActive = true
//        quoteLabel.text = "Lorem Ipsum something something something Lorem Ipsum something something something Lorem Ipsum something something something Lorem Ipsum something something something"
        quoteLabel.numberOfLines = 0
        quoteLabel.font = UIFont(name: "Hiragino Mincho ProN W3", size: 18.0)
        quoteLabel.textAlignment = .natural
    }
    
    func setupButton() {
        randomButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -100).isActive = true
        randomButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        randomButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0.0).isActive = true
        randomButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
//        randomButton.titleLabel?.font = UIFont(name: "Hiragino Mincho ProN W3", size: 16)
//        randomButton.backgroundColor = UIColor.init(red: 121/255, green: 161/255, blue: 200/255, alpha: 1.0)
//        randomButton.backgroundColor = UIColor.systemBlue
        randomButton.layer.cornerRadius = 8
        
        if let randomImage = UIImage(systemName: "goforward") {
            randomButton.setImage(randomImage, for: .normal)
        }
        randomButton.imageView?.contentMode = .scaleAspectFill
        randomButton.imageEdgeInsets = UIEdgeInsets(top: 60, left: 60, bottom: 60, right: 60)
    }
    
    func setupContainerView() {
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        containerView.backgroundColor = UIColor.systemBackground
    }
    
    func setupTitleLabel() {
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -240).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
//        titleLabel.text = "Hello World"
        titleLabel.font = UIFont(name: "Hiragino Mincho ProN W3", size: 32.0)
        titleLabel.textAlignment = .center
    }
    
}
