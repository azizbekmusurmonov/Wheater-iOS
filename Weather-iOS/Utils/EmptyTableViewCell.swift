//
//  EmptyTableViewCell.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit


class EmptyTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(style: .default, reuseIdentifier: "reuseIdentifier")
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        
    }
    
    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, _ color: UIColor = .clear) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = color
        self.backgroundColor = color
        self.selectionStyle = .none
        
        titleLabel = self.contentView.label20("My title")
        
        
        self.contentView.addSubview(self.contentView.label20Bold(40, top: 120, title: "My title"))
        
    }
    
    
}


