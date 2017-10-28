//
//  ArticleTableViewCell.swift
//  SwiftDemo
//
//  Created by Capternal on 25/10/17.
//  Copyright © 2017 Capternal. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    var objBackView: UIView!
    var objUIImageView: UIImageView!
    var objUIButtonCategory: UIButton!
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
        objBackView.backgroundColor = UIColor.white
        contentView.addSubview(objBackView)
        
        objUIImageView = UIImageView()
        objUIImageView.image = UIImage.init(named: "3.jpg")
        objUIImageView.contentMode = UIViewContentMode.scaleToFill
        objBackView.addSubview(objUIImageView)
        
        objUIButtonCategory = UIButton()
        objUIButtonCategory.setTitle(" Show ", for: UIControlState.normal)
        objUIButtonCategory.setTitleColor(UIColor.white, for: UIControlState.normal)
        objUIButtonCategory.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        objUIButtonCategory.backgroundColor = AppConstants.Colors.COLOR_BLUE
        objBackView.addSubview(objUIButtonCategory)
        
        objUITextViewTitle = UITextView()
        objUITextViewTitle.isEditable = false
        objUITextViewTitle.isScrollEnabled = false
        objUITextViewTitle.text = "lorem ipsum carrots, enhanced undergraduate developer"
        objUITextViewTitle.font = UIFont.boldSystemFont(ofSize: 14)
        objUITextViewTitle.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        objUITextViewTitle.textColor = UIColor.white
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
        
        // Category
        objUIButtonCategory.translatesAutoresizingMaskIntoConstraints = false
        objUIButtonCategory.heightAnchor.constraint(equalToConstant: 30).isActive = true
        objUIButtonCategory.centerYAnchor.constraint(equalTo: objBackView.centerYAnchor).isActive = true
        
        // Title
        objUITextViewTitle.translatesAutoresizingMaskIntoConstraints = false
        objUITextViewTitle.topAnchor.constraint(equalTo: objUIButtonCategory.bottomAnchor).isActive = true
        objUITextViewTitle.leftAnchor.constraint(equalTo: objBackView.leftAnchor).isActive = true
        objUITextViewTitle.rightAnchor.constraint(equalTo: objBackView.centerXAnchor).isActive = true
        objUITextViewTitle.bottomAnchor.constraint(equalTo: objBackView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
