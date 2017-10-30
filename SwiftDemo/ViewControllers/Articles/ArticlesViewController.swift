//
//  ArticlesViewController.swift
//  SwiftDemo
//
//  Created by Capternal on 25/10/17.
//  Copyright © 2017 Capternal. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ArticlesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var objDailyNews : NSDictionary = NSDictionary.init()
    var arrHeaders : NSMutableArray = NSMutableArray.init()
    var intSection : Int = 0
    var storedOffsets = [Int: CGFloat]()
    
    let objUITableViewArticles : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.tableFooterView = UIView.init(frame: CGRect.zero)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.separatorColor = UIColor.clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = AppConstants.ScreenTitles.DAILY_NEWS
        loadUI()
    }

    private func loadUI() {
        // TableView
        objUITableViewArticles.delegate = self
        objUITableViewArticles.dataSource = self
        view.addSubview(objUITableViewArticles)

        objUITableViewArticles.translatesAutoresizingMaskIntoConstraints = false
        objUITableViewArticles.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        objUITableViewArticles.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        objUITableViewArticles.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        objUITableViewArticles.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        apiDailyNews()
    }

    private func apiDailyNews() {
        print("URL : \(APPURL.DailyNews)")
        
        Alamofire.request(APPURL.DailyNews).responseJSON { response in
            if let json = response.result.value {
                self.objDailyNews = json as! NSDictionary
                self.arrHeaders = NSMutableArray.init(array: (json as! NSDictionary).allKeys.reversed())
                self.objUITableViewArticles.reloadData()
            }
        }
    }
    
    /**
     * Table Delegates
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrHeaders.count > 0 ? arrHeaders.count : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arrNewsCount = (objDailyNews.object(forKey: arrHeaders.object(at: section)) as! NSArray).count
        return  arrNewsCount > 0 ? arrNewsCount : 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? GallariesTableViewCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forSection: indexPath.section, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? GallariesTableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("HEADERS : \(arrHeaders)")
        let arrNews : NSMutableArray = NSMutableArray.init(array: objDailyNews.object(forKey: arrHeaders.object(at: indexPath.section)) as! NSArray)
        switch indexPath.section {
        case 0:// Article
            let dictionaryNew : NSMutableDictionary = NSMutableDictionary.init(dictionary: (arrNews.object(at: indexPath.row) as! NSDictionary))
            let cell = ArticleTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "artificialCell")
            cell.objUIButtonCategory.setTitle(dictionaryNew["category"] as? String, for: UIControlState.normal)
            cell.objUITextViewTitle.text = dictionaryNew["title"] as? String
            cell.objUIImageView.af_setImage(
                withURL: URL.init(string: dictionaryNew.object(forKey: "img") as! String)!,
                placeholderImage: UIImage.init(named: "placeholder"))
            return cell
        case 1:// OtherNews
            let dictionaryNew : NSMutableDictionary = NSMutableDictionary.init(dictionary: (arrNews.object(at: indexPath.row) as! NSDictionary))
//            print("OBJECT : \(dictionaryNew)")

            let cell = OtherNewsTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "otherCell")
            cell.objUIImageView.af_setImage(
                withURL: URL.init(string: dictionaryNew.object(forKey: "img") as! String)!,
                placeholderImage: UIImage.init(named: "placeholder")
            )
            cell.objUITextViewTitle.text = dictionaryNew["title"] as? String
            cell.objUIButtonViews.setTitle(" \(dictionaryNew["views"] as! Int)" , for: UIControlState.normal)
            cell.objUIButtonLike.setTitle(" \(dictionaryNew["likes"] as! Int)" , for: UIControlState.normal)
            cell.objUIButtonCategory.setTitle(String(describing: dictionaryNew["category"] as! String), for: UIControlState.normal)
            return cell
        case 2:// Gallaries
            intSection = indexPath.section
            let dictionaryNew : NSMutableDictionary = NSMutableDictionary.init(dictionary: (arrNews.object(at: indexPath.row) as! NSDictionary))
            let cell = GallariesTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "galleriesCell")
            
            // Title
            let objUITextViewTitle = UITextView()
            objUITextViewTitle.isEditable = false
            objUITextViewTitle.isScrollEnabled = false
            objUITextViewTitle.isUserInteractionEnabled = false
            objUITextViewTitle.text = dictionaryNew.object(forKey: "artist") as! String
            objUITextViewTitle.font = UIFont.boldSystemFont(ofSize: 26)
            objUITextViewTitle.textColor = UIColor.white
            objUITextViewTitle.backgroundColor = UIColor.clear
            cell.contentView.addSubview(objUITextViewTitle)
            
            objUITextViewTitle.translatesAutoresizingMaskIntoConstraints = false
            objUITextViewTitle.leftAnchor.constraint(equalTo: cell.contentView.leftAnchor, constant: 10).isActive = true
            objUITextViewTitle.rightAnchor.constraint(equalTo: cell.contentView.rightAnchor, constant: -10).isActive = true
            objUITextViewTitle.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor, constant: -20).isActive = true
            return cell
        default:
            let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "default")
            return cell;
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Header View
        let headerView = UIView()
        headerView.backgroundColor = UIColor.white
        
        // Header Title
        let headerTitle = UILabel()
        headerTitle.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        headerTitle.text = (arrHeaders.object(at: section) as? String)?.localizedCapitalized.replacingOccurrences(of: "_", with: " ")
        headerTitle.textColor = UIColor.black
        headerView.addSubview(headerTitle)
        
        // Header Title Constriants
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20).isActive = true
        headerTitle.widthAnchor.constraint(equalTo: headerView.widthAnchor).isActive = true
        headerTitle.heightAnchor.constraint(equalTo: headerView.heightAnchor).isActive = true
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 200
        case 1:
            return 150
        case 2:
            return 250
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrNews : NSMutableArray = NSMutableArray.init(array: objDailyNews.object(forKey: arrHeaders.object(at: indexPath.section)) as! NSArray)
        let dictionaryNew : NSMutableDictionary = NSMutableDictionary.init(dictionary: (arrNews.object(at: indexPath.row) as! NSDictionary))

        AppConstants.UserDefaultManager.setValue(dictionaryNew, forKey: "news")
        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "ArticleDetailsViewController"))!, animated: true)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let arrNews : NSMutableArray = NSMutableArray.init(array: (objDailyNews.object(forKey: arrHeaders.object(at: intSection)) as? NSArray)!)
        print("COLLECTIONVIEW METHOD : \(arrNews)")
        return ((arrNews.object(at: collectionView.tag) as? NSDictionary)!.object(forKey: "images") as? NSArray)!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let arrNews : NSMutableArray = NSMutableArray.init(array: (objDailyNews.object(forKey: arrHeaders.object(at: intSection)) as? NSArray)!)
        let dictionaryNew : NSMutableDictionary = NSMutableDictionary.init(dictionary: (arrNews.object(at: collectionView.tag) as! NSDictionary))

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                                      for: indexPath)
        let objUIImageView = UIImageView()
        objUIImageView.af_setImage(
            withURL: URL.init(string: (((dictionaryNew.object(forKey: "images") as? NSArray)?.object(at: indexPath.row) as? NSDictionary)?.object(forKey: "img") as? String)!)!,
            placeholderImage: UIImage.init(named: "placeholder")
        )

        objUIImageView.contentMode = UIViewContentMode.scaleToFill
        cell.contentView.addSubview(objUIImageView)
        objUIImageView.translatesAutoresizingMaskIntoConstraints = false
        objUIImageView.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor, constant: 0).isActive = true
        objUIImageView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor, constant: 0).isActive = true
        objUIImageView.widthAnchor.constraint(equalTo: cell.contentView.widthAnchor, constant: 0).isActive = true
        objUIImageView.heightAnchor.constraint(equalTo: cell.contentView.heightAnchor, constant: 0).isActive = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let arrNews : NSMutableArray = NSMutableArray.init(array: (objDailyNews.object(forKey: arrHeaders.object(at: intSection)) as? NSArray)!)
//        let dictionaryNew : NSMutableDictionary = NSMutableDictionary.init(dictionary: (arrNews.object(at: collectionView.tag) as! NSDictionary))
//
//        AppConstants.UserDefaultManager.setValue(dictionaryNew, forKey: "news")
//        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "GalleryDetailViewController"))!, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
