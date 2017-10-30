//
//  OtherNewsTableViewCell.swift
//  SwiftDemo
//
//  Created by Capternal on 26/10/17.
//  Copyright © 2017 Capternal. All rights reserved.
//

import UIKit

class OtherNewsTableViewCell: UITableViewCell {

    var objBackView: UIView!
    var objUIImageView: UIImageView!
    var objUITextViewTitle: UITextView!
    var objUIButtonCategory: UIButton!
    var objUIButtonViews: UIButton!
    var objUIButtonLike: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = UITableViewCellSelectionStyle.none
        backgroundColor = UIColor.clear
        
        objBackView = UIView()
        objBackView.backgroundColor = UIColor.white
        contentView.addSubview(objBackView)
        
        objUIImageView = UIImageView()
        objUIImageView.image = UIImage.init(named: "6.jpg")
        objUIImageView.contentMode = UIViewContentMode.scaleToFill
        objBackView.addSubview(objUIImageView)
        
        objUITextViewTitle = UITextView()
        objUITextViewTitle.isUserInteractionEnabled = false
        objUITextViewTitle.isEditable = false
        objUITextViewTitle.isScrollEnabled = false
        objUITextViewTitle.text = "homework if cupidatat consumer to find pleasure"
        objUITextViewTitle.font = UIFont.boldSystemFont(ofSize: 14)
        objBackView.addSubview(objUITextViewTitle)
        
        objUIButtonCategory = UIButton()
        objUIButtonCategory.setTitle(" Show ", for: UIControlState.normal)
        objUIButtonCategory.setTitleColor(UIColor.white, for: UIControlState.normal)
        objUIButtonCategory.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        objUIButtonCategory.backgroundColor = AppConstants.Colors.COLOR_BLUE
        objBackView.addSubview(objUIButtonCategory)
        
        objUIButtonViews = UIButton()
        objUIButtonViews.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        objUIButtonViews.setImage(UIImage.init(named: "eye"), for: UIControlState.normal)
        objUIButtonViews.setTitle("123", for: UIControlState.normal)
        objUIButtonViews.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        objUIButtonViews.setTitleColor(UIColor.black, for: UIControlState.normal)
        objBackView.addSubview(objUIButtonViews)

        objUIButtonLike = UIButton()
        objUIButtonLike.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        objUIButtonLike.setImage(UIImage.init(named: "like"), for: UIControlState.normal)
        objUIButtonLike.setTitle("247", for: UIControlState.normal)
        objUIButtonLike.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        objUIButtonLike.setTitleColor(UIColor.black, for: UIControlState.normal)
        objBackView.addSubview(objUIButtonLike)
        
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
        objUIImageView.centerYAnchor.constraint(equalTo: objBackView.centerYAnchor, constant: 0).isActive = true
        objUIImageView.topAnchor.constraint(equalTo: objBackView.topAnchor, constant: 5).isActive = true
        objUIImageView.leftAnchor.constraint(equalTo: objBackView.leftAnchor, constant: 5).isActive = true
        objUIImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        objUIImageView.bottomAnchor.constraint(equalTo: objBackView.bottomAnchor, constant: -5).isActive = true
        
        // Title
        objUITextViewTitle.translatesAutoresizingMaskIntoConstraints = false
        objUITextViewTitle.leftAnchor.constraint(equalTo: objUIImageView.rightAnchor, constant: 5).isActive = true
        objUITextViewTitle.rightAnchor.constraint(equalTo: objBackView.rightAnchor, constant: -5).isActive = true
        objUITextViewTitle.topAnchor.constraint(equalTo: objBackView.topAnchor, constant: 5).isActive = true
        objUITextViewTitle.bottomAnchor.constraint(equalTo: objBackView.bottomAnchor, constant: -40).isActive = true
        
        // Category
        objUIButtonCategory.translatesAutoresizingMaskIntoConstraints = false
        objUIButtonCategory.heightAnchor.constraint(equalToConstant: 30).isActive = true
        objUIButtonCategory.bottomAnchor.constraint(equalTo: objBackView.bottomAnchor, constant: -5).isActive = true
        objUIButtonCategory.rightAnchor.constraint(equalTo: objBackView.rightAnchor, constant: -5).isActive = true
        
        // Image Views
        objUIButtonViews.translatesAutoresizingMaskIntoConstraints = false
        objUIButtonViews.heightAnchor.constraint(equalToConstant: 30).isActive = true
        objUIButtonViews.bottomAnchor.constraint(equalTo: objBackView.bottomAnchor, constant: -5).isActive = true
        objUIButtonViews.leftAnchor.constraint(equalTo: objUIImageView.rightAnchor, constant: 5).isActive = true

        // Image Like
        objUIButtonLike.translatesAutoresizingMaskIntoConstraints = false
        objUIButtonLike.heightAnchor.constraint(equalToConstant: 30).isActive = true
        objUIButtonLike.bottomAnchor.constraint(equalTo: objBackView.bottomAnchor, constant: -5).isActive = true
        objUIButtonLike.leftAnchor.constraint(equalTo: objUIButtonViews.rightAnchor, constant: 10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
