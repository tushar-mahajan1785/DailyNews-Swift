//
//  GalleryDetailViewController.swift
//  SwiftDemo
//
//  Created by Capternal on 30/10/17.
//  Copyright © 2017 Capternal. All rights reserved.
//

import UIKit

class GalleryDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }

    // ScrollView
    let objUIScrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.white
        return scrollView
    }()
    
    // Views Count
    let objUIButtonViews: UIButton = {
        
        let button = UIButton()
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        button.setImage(UIImage.init(named: "eye"), for: UIControlState.normal)
        button.setTitle(" \((AppConstants.UserDefaultManager.value(forKey: "news") as! NSDictionary).object(forKey: "views") as! Int)", for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.gray, for: UIControlState.normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 0)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        return button
    }()
    
    // Likes Count
    let objUIButtonLike: UIButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        button.setImage(UIImage.init(named: "like"), for: UIControlState.normal)
        button.setTitle(" \((AppConstants.UserDefaultManager.value(forKey: "news") as! NSDictionary).object(forKey: "likes") as! Int)", for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.gray, for: UIControlState.normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 0)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        return button
    }()
    
    // DisLike Count
    let objUIButtonDisLike: UIButton = {
        let button = UIButton()
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        button.setImage(UIImage.init(named: "dislike"), for: UIControlState.normal)
        button.setTitle(" \((AppConstants.UserDefaultManager.value(forKey: "news") as! NSDictionary).object(forKey: "dislikes") as! Int)", for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(UIColor.gray, for: UIControlState.normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 0)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        return button
    }()
    
    let objUITextViewTitle : UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = UIFont.boldSystemFont(ofSize: 22)
        textView.textColor = UIColor.black
        textView.text = (AppConstants.UserDefaultManager.value(forKey: "news") as! NSDictionary).object(forKey: "title") as? String
        return textView
    }()
    
    let objUITextViewArticleBy : UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.backgroundColor = UIColor.white
        
        let startText : NSAttributedString =  NSAttributedString(string: "Artist : ", attributes: [NSAttributedStringKey.foregroundColor : AppConstants.Colors.COLOR_BLUE, NSAttributedStringKey.font : UIFont.systemFont(ofSize: 22)])
        let endText : NSAttributedString = NSAttributedString(string: ((AppConstants.UserDefaultManager.value(forKey: "news") as! NSDictionary).object(forKey: "artist") as? String)!, attributes: [NSAttributedStringKey.foregroundColor : AppConstants.Colors.COLOR_BLUE, NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 22)])
        let mutableString : NSMutableAttributedString = NSMutableAttributedString(attributedString: startText)
        mutableString.append(endText)
        textView.attributedText = mutableString
        return textView
    }()
    
    let objUICollectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: AppConstants.ScreenSize.SCREEN_WIDTH, height: AppConstants.ScreenSize.SCREEN_HEIGHT*0.30)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: CGRect.init(x: 0, y: 0, width: AppConstants.ScreenSize.SCREEN_WIDTH, height: AppConstants.ScreenSize.SCREEN_HEIGHT*0.30), collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        return collectionView
    }()
    
//    let objUIImageViewArticle : UIImageView = {
//        let imageView = UIImageView()
//        imageView.af_setImage(
//            withURL: URL.init(string: ((AppConstants.UserDefaultManager.value(forKey: "news") as! NSDictionary).object(forKey: "img") as? String)!)!,
//            placeholderImage: UIImage.init(named: "placeholder")
//        )
//        return imageView
//    }()
    
    let objUITextViewDescription : UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = UIColor.black
        textView.text = (AppConstants.UserDefaultManager.value(forKey: "news") as! NSDictionary).object(forKey: "desc") as? String
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = AppConstants.ScreenTitles.DAILY_NEWS
        loadUI()
    }
    
    private func loadUI() {
        // Add All objects in Controller View
        view.addSubview(objUIScrollView)
        
        objUIScrollView.addSubview(objUIButtonViews)
        objUIScrollView.addSubview(objUIButtonLike)
        objUIScrollView.addSubview(objUIButtonDisLike)
        
        objUIScrollView.addSubview(objUITextViewTitle)
        objUIScrollView.addSubview(objUITextViewArticleBy)
        
        objUICollectionView.delegate = self
        objUICollectionView.dataSource = self
        
        objUIScrollView.addSubview(objUICollectionView)
        objUIScrollView.addSubview(objUITextViewDescription)
        
        setupLayout()
        
    }
    
    private func setupLayout() {
        // ScrollView Constriant
        objUIScrollView.translatesAutoresizingMaskIntoConstraints = false
        objUIScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        objUIScrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        objUIScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        objUIScrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
        objUIButtonViews.translatesAutoresizingMaskIntoConstraints = false
        objUIButtonViews.leftAnchor.constraint(equalTo: objUIScrollView.leftAnchor, constant: 5).isActive = true
        objUIButtonViews.topAnchor.constraint(equalTo: objUIScrollView.topAnchor, constant: 5).isActive = true
        objUIButtonViews.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        objUIButtonLike.translatesAutoresizingMaskIntoConstraints = false
        objUIButtonLike.leftAnchor.constraint(equalTo: objUIButtonViews.rightAnchor, constant: 10).isActive = true
        objUIButtonLike.topAnchor.constraint(equalTo: objUIButtonViews.topAnchor, constant: 0).isActive = true
        objUIButtonLike.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        objUIButtonDisLike.translatesAutoresizingMaskIntoConstraints = false
        objUIButtonDisLike.leftAnchor.constraint(equalTo: objUIButtonLike.rightAnchor, constant: 10).isActive = true
        objUIButtonDisLike.topAnchor.constraint(equalTo: objUIButtonViews.topAnchor, constant: 0).isActive = true
        objUIButtonDisLike.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        objUITextViewTitle.translatesAutoresizingMaskIntoConstraints = false
        objUITextViewTitle.topAnchor.constraint(equalTo: objUIButtonDisLike.bottomAnchor, constant: 10).isActive = true
        objUITextViewTitle.leftAnchor.constraint(equalTo: objUIScrollView.leftAnchor, constant: 0).isActive = true
        objUITextViewTitle.rightAnchor.constraint(equalTo: objUIScrollView.rightAnchor, constant: 0).isActive = true
        objUITextViewTitle.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        
        objUITextViewArticleBy.translatesAutoresizingMaskIntoConstraints = false
        objUITextViewArticleBy.topAnchor.constraint(equalTo: objUITextViewTitle.bottomAnchor, constant:0).isActive = true
        objUITextViewArticleBy.leftAnchor.constraint(equalTo: objUIScrollView.leftAnchor, constant: 0).isActive = true
        objUITextViewArticleBy.rightAnchor.constraint(equalTo: objUIScrollView.rightAnchor, constant: 0).isActive = true
        objUITextViewArticleBy.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        objUICollectionView.translatesAutoresizingMaskIntoConstraints = false
        objUICollectionView.topAnchor.constraint(equalTo: objUITextViewArticleBy.bottomAnchor, constant: 0)
        objUICollectionView.leftAnchor.constraint(equalTo: objUIScrollView.leftAnchor, constant: 0).isActive = true
        objUICollectionView.rightAnchor.constraint(equalTo: objUIScrollView.rightAnchor, constant: 0).isActive = true
        objUICollectionView.heightAnchor.constraint(equalTo: objUIScrollView.heightAnchor, constant: AppConstants.ScreenSize.SCREEN_HEIGHT*0.30).isActive = true
        
//        objUIImageViewArticle.translatesAutoresizingMaskIntoConstraints = false
//        objUIImageViewArticle.topAnchor.constraint(equalTo: objUITextViewArticleBy.bottomAnchor, constant: 0).isActive = true
//        objUIImageViewArticle.leftAnchor.constraint(equalTo: objUIScrollView.leftAnchor, constant: 0).isActive = true
//        objUIImageViewArticle.rightAnchor.constraint(equalTo: objUIScrollView.rightAnchor, constant: 0).isActive = true
//        objUIImageViewArticle.heightAnchor.constraint(equalToConstant: 200).isActive = true
//
        objUITextViewDescription.translatesAutoresizingMaskIntoConstraints = false
        objUITextViewDescription.topAnchor.constraint(equalTo: objUICollectionView.bottomAnchor, constant:10).isActive = true
        objUITextViewDescription.leftAnchor.constraint(equalTo: objUIScrollView.leftAnchor, constant: 10).isActive = true
        objUITextViewDescription.rightAnchor.constraint(equalTo: objUIScrollView.rightAnchor, constant: -10).isActive = true
        objUITextViewDescription.bottomAnchor.constraint(equalTo: objUIScrollView.bottomAnchor).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
