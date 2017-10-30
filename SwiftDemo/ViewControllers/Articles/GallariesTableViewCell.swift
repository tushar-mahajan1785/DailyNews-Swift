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
    var objUICollectionView : UICollectionView!
    var objUITextViewTitle: UITextView!
    var section: Int = 0
    
    var collectionViewOffset: CGFloat {
        get {
            return objUICollectionView.contentOffset.x
        }
        
        set {
            objUICollectionView.contentOffset.x = newValue
        }
    }
    
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
        
        setupLayout()
    }
    
    func setCollectionViewDataSourceDelegate
        <D: UICollectionViewDataSource & UICollectionViewDelegate>
        (dataSourceDelegate: D, forSection section: Int, forRow row: Int) {

        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: frame.size.width, height: frame.size.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        objUICollectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        objUICollectionView.delegate = dataSourceDelegate
        objUICollectionView.dataSource = dataSourceDelegate
        objUICollectionView.isPagingEnabled = true
        objUICollectionView.tag = row
        objUICollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        objBackView.addSubview(objUICollectionView)

        self.section = section
        objUICollectionView.translatesAutoresizingMaskIntoConstraints = false
        objUICollectionView.centerXAnchor.constraint(equalTo: objBackView.centerXAnchor, constant: 0).isActive = true
        objUICollectionView.centerYAnchor.constraint(equalTo: objBackView.centerYAnchor, constant: 0).isActive = true
        objUICollectionView.widthAnchor.constraint(equalTo: objBackView.widthAnchor, constant: 0).isActive = true
        objUICollectionView.heightAnchor.constraint(equalTo: objBackView.heightAnchor, constant: 0).isActive = true
        objUICollectionView.reloadData()
    }
    
    private func setupLayout() {
        // BackView
        objBackView.translatesAutoresizingMaskIntoConstraints = false
        objBackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        objBackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        objBackView.widthAnchor.constraint(equalTo: widthAnchor, constant: 0).isActive = true
        objBackView.heightAnchor.constraint(equalTo: heightAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
