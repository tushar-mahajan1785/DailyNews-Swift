//
//  CustomTableViewCell.swift
//  SwiftDemo
//
//  Created by Capternal on 23/10/17.
//  Copyright © 2017 Capternal. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    var objBackView: UIView!
    var labelName: UILabel!
    var labelImage: UIImageView!
    let cellHeight = 100
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        objBackView = UIView.init(frame: CGRect(x: 5, y: 5, width: Int(AppConstants.ScreenSize.SCREEN_WIDTH-10), height: cellHeight))
        objBackView.backgroundColor = UIColor.white

        labelImage = UIImageView(frame: CGRect(x: 5, y: 5, width: objBackView.frame.size.height - 10, height: objBackView.frame.size.height - 10))
        
        labelName = UILabel(frame: CGRect(x: labelImage.frame.origin.x+labelImage.frame.size.width+5, y: 5, width: objBackView.frame.size.width - (labelImage.frame.origin.x+labelImage.frame.size.width+5), height: objBackView.frame.size.height - 10))
        labelName.font = UIFont.boldSystemFont(ofSize: 16)
        
        contentView.addSubview(labelImage)
        contentView.addSubview(labelName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
