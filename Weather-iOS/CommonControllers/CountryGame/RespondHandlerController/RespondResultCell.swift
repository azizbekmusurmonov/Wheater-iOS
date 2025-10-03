//
//  RespondResultCell.swift
//  XalqBank
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

class RespondResultCell: UITableViewCell{
    
    var model: SharedResponse!
        
    func setUI(model: SharedResponse, dataHeight: CGFloat){
        self.model = model
        
        let baseView = UIView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: (dataHeight) + (20)))
        baseView.backgroundColor = .clear
        self.contentView.addSubview(baseView)
        
        let message = UILabel(frame: CGRect(x: (20), y: (20), width: windowWidth - (40), height: (dataHeight + 10)))
        message.numberOfLines = 0
        message.text = model.formattedData
        message.textColor = .colorTextDark
        message.font = .appFont(16)
        baseView.addSubview(message)
        
    }
    
    init() {
        super.init(style: .default, reuseIdentifier: "RespondHandlerCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
