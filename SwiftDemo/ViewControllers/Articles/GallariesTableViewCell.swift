//
//  GallariesTableViewCell.swift
//  SwiftDemo
//
//  Created by Capternal on 26/10/17.
//  Copyright © 2017 Capternal. All rights reserved.
//

import UIKit

class GallariesTableViewCell: UITableViewCell {

    var objBackView: UIView!
    var objUIImageView: UIImageView!
    var objUITextViewTitle: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = UITableViewCellSelectionStyle.none
        backgroundColor = UIColor.clear
        
        objBackView = UIView()
        objBackView.backgroundColor = UIColor.cyan
        contentView.addSubview(objBackView)
        
        objUIImageView = UIImageView()
        objUIImageView.image = UIImage.init(named: "1_1.jpg")
        objUIImageView.contentMode = UIViewContentMode.scaleToFill
        objBackView.addSubview(objUIImageView)
        
        objUITextViewTitle = UITextView()
        objUITextViewTitle.isEditable = false
        objUITextViewTitle.isScrollEnabled = false
        objUITextViewTitle.text = "Ariana Grande"
        objUITextViewTitle.font = UIFont.boldSystemFont(ofSize: 26)
        objUITextViewTitle.textColor = UIColor.white
        objUITextViewTitle.backgroundColor = UIColor.clear
        objBackView.addSubview(objUITextViewTitle)
        
        setupLayout()
    }
    
    private func setupLayout() {
        // BackView
        objBackView.translatesAutoresizingMaskIntoConstraints = false
        objBackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        objBackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        objBackView.widthAnchor.constraint(equalTo: widthAnchor, constant: 0).isActive = true
        objBackView.heightAnchor.constraint(equalTo: heightAnchor, constant: 0).isActive = true
        
        // Image
        objUIImageView.translatesAutoresizingMaskIntoConstraints = false
        objUIImageView.centerXAnchor.constraint(equalTo: objBackView.centerXAnchor, constant: 0).isActive = true
        objUIImageView.centerYAnchor.constraint(equalTo: objBackView.centerYAnchor, constant: 0).isActive = true
        objUIImageView.widthAnchor.constraint(equalTo: objBackView.widthAnchor, constant: 0).isActive = true
        objUIImageView.heightAnchor.constraint(equalTo: objBackView.heightAnchor, constant: 0).isActive = true
        
        // Title
        objUITextViewTitle.translatesAutoresizingMaskIntoConstraints = false
        objUITextViewTitle.leftAnchor.constraint(equalTo: objBackView.leftAnchor, constant: 10).isActive = true
        objUITextViewTitle.rightAnchor.constraint(equalTo: objBackView.rightAnchor, constant: -10).isActive = true
        objUITextViewTitle.bottomAnchor.constraint(equalTo: objBackView.bottomAnchor, constant: -20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
