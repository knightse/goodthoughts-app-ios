//
//  LibraryViewCellTableViewCell.swift
//  GoodThoughts
//
//  Created by Caine Simpson on 1/15/21.
//

import UIKit

class LibraryViewCell: UITableViewCell {
    
    let quotelabel = UILabel()
    let authorLabel = UILabel()
    let shareButton = UIButton()
    
    let containerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addViews() {
        setupTranslates()
        self.contentView.addSubview(containerView)
        setupContainerView()
        self.containerView.addSubview(quotelabel)
        self.containerView.addSubview(authorLabel)
        self.containerView.addSubview(shareButton)
        setupContentViews()
    }
    
    func setupContainerView() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        self.containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupTranslates() {
        quotelabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupContentViews() {
        quotelabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        quotelabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20).isActive = true
        quotelabel.heightAnchor.constraint(equalToConstant:50).isActive = true
        quotelabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: -80).isActive = true
//        quotelabel.backgroundColor = .blue
        quotelabel.numberOfLines = 3
        quotelabel.font = UIFont(name: "Helvetica", size: 12.0)
//        quotelabel.backgroundColor = .systemPink
//        quotelabel.text = "Lorem IPSUM SOMEHTOLAJLFJDS:L JF:LDSJ:LKJ SD:LK SDL:J L:KDSL:KFJ S:LDKJ SD:LJ adslkf ;laksd  ;alsdkjf a;lsdkf j;alskdf j;alsdkf al;ksdfj ;laskdj fa;s dlfja;lskdf ja;slf "
        
        authorLabel.topAnchor.constraint(equalTo: quotelabel.bottomAnchor, constant: 1).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: quotelabel.leftAnchor, constant: 1).isActive = true
//        authorLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
//        authorLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        authorLabel.widthAnchor.constraint(equalTo: quotelabel.widthAnchor, constant: -30).isActive = true
//        authorLabel.backgroundColor = .blue
//        authorLabel.text = "Crli Mine"
        
        
        
        shareButton.leftAnchor.constraint(equalTo: quotelabel.rightAnchor, constant: 1).isActive = true
        shareButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 1).isActive = true
        shareButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 1).isActive = true
        shareButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 1).isActive = true
        if let image = UIImage(systemName: "square.and.arrow.up") {
            shareButton.setImage(image, for: .normal)
        }
        shareButton.imageView?.contentMode = .scaleAspectFill
    }
}
