//
//  RespondHandlerCell.swift
//  XalqBank
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

class RespondHandlerCell: UITableViewCell{
    
    var onAction: (() -> Void)?
    
    var onLongAction: ((SharedResponse) -> Void)?
    
    private var model: SharedResponse!
    
    func setUI(model: SharedResponse){
        self.model = model
        
        let baseView = UIView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: (69)))
        baseView.backgroundColor = .clear
        baseView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tpn)))
        baseView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(onLongPress)))
        self.contentView.addSubview(baseView)
        
        baseView.addDivider(rect: CGRect(x: 20, y: 0, width: windowWidth - 40, height: 0.9))
        
        let message = UILabel(frame: CGRect(x: (20), y: 0, width: windowWidth - (40), height: (20)))
        message.numberOfLines = 1
        message.text = model.headers
        message.textColor = .colorTextDark
        message.font = .appFont(16)
        baseView.addSubview(message)
        
        let labelStatus = UILabel(frame: CGRect(x: (20), y: message.frame.maxY + (4), width: windowWidth - (40), height: (20)))
        labelStatus.numberOfLines = 1
        labelStatus.text = "\(self.model.statusCode)"
        labelStatus.textAlignment = .left
        labelStatus.textColor = .colorTextDark
        labelStatus.font = .appFont(17, .FONT_BOLD)
        baseView.addSubview(labelStatus)
        
        let labelResTime = UILabel(frame: CGRect(x: (20), y: message.frame.maxY + (4), width: windowWidth - (40), height: (20)))
        labelResTime.numberOfLines = 1
        labelResTime.text = "Res in : \(model.operationTime) sec"
        labelResTime.textColor = .colorTextDark
        labelResTime.textAlignment = .right
        labelResTime.font = .appFont(15, .FONT_BLACK)
        baseView.addSubview(labelResTime)
        
        let data = UILabel(frame: CGRect(x: (20), y: labelResTime.frame.maxY , width: windowWidth - (40), height: (16)))
        data.numberOfLines = 1
        data.text = model.time
        data.textAlignment = .right
        data.textColor = .colorTextDark
        data.font = .appFont(12)
        baseView.addSubview(data) 
    }
    
    init() {
        super.init(style: .default, reuseIdentifier: "RespondHandlerCell")
    }
    
    @objc func tpn(){
        self.onAction?()
    }
    
    @objc func onLongPress(){
        self.onLongAction?(self.model)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

