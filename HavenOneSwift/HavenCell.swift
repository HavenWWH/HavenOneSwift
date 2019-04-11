//
//  HavenCell.swift
//  ONESwift
//
//  Created by 吴文海 on 2019/4/1.
//  Copyright © 2019 吴文海. All rights reserved.
//

import UIKit

class HavenCell: UITableViewCell {
    
    lazy var tLable: UILabel = {
    
        let tempLable = UILabel.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        tempLable.center = self.center
        tempLable.textColor = .blue
        tempLable.font = .systemFont(ofSize: 18)
        return tempLable
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(self.tLable)
        self.tLable.text = "00000"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setttingData(str: String) {
        
        self.tLable.text = str + "不点我你肯定后悔"
    }
}
