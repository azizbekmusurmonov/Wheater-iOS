//
//  UIController+Extensions.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

extension UIViewController {
    
    func createDefaultCell(_ style: UITableViewCell.CellStyle = .subtitle) -> UITableViewCell {
        let cell = UITableViewCell(style: style, reuseIdentifier: "UITableViewCell")
        cell.accessoryType = .none
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.textLabel?.textColor = .colorTextDark
        cell.textLabel?.font = .appFont(17)
        cell.detailTextLabel?.textColor = .colorTextMedium
        cell.detailTextLabel?.font = .appFont(15 )
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func createEmptyCell(_ style: UITableViewCell.CellStyle = .subtitle) -> UITableViewCell {
        let cell = EmptyTableViewCell(style: style, reuseIdentifier: "UITableViewCell")
        cell.accessoryType = .none
        cell.contentView.backgroundColor = .clear
        cell.backgroundColor = .clear
        return cell
    }
    
    func createDefaultLabel(_ frame: CGRect? = nil) -> UILabel {
        var label = UILabel()
        if let f = frame {
            label = UILabel(frame: f)
        }
        label.textColor = .colorTextMedium
        label.font = .appFont(15, .FONT_MEDIUM)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }
    
    func createBackSectionHeader(_ title: String = "", _ action: Selector?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: 30))
        view.backgroundColor = .clear
        var left: CGFloat = 16
        if let act = action {
            let buttonBack = UIButton(frame: CGRect(x: 10, y: 0, width: 30, height: view.frame.height))
            buttonBack.set(.lMenuCart)
            buttonBack.tag = HeaderAction.back.rawValue
            buttonBack.contentHorizontalAlignment = .center
            buttonBack.addTarget(self, action: act, for: .touchUpInside)
            view.addSubview(buttonBack)
            left += buttonBack.frame.maxX
        }
        
        let label = UILabel(frame: CGRect(x: left, y: 0, width: view.frame.width - 16 - left, height: view.frame.height))
        label.text = title
        label.font = .appFont(18, .FONT_BOLD)
        label.textColor = .colorTextDark
        label.textAlignment = .center
        view.addSubview(label)
        
        return view
    }
    
    func createActinableSectionHeader(_ title: String? = nil, _ actions: [HeaderAction], _ selector: Selector, height: CGFloat = 0, _ titleColor: UIColor = .colorTextDark, fixLabel: Bool = false) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: height, width: windowWidth, height: 30))
        view.backgroundColor = .clear
        
        let image = UIImageView(frame: CGRect(x: 0, y: -5, width: windowWidth, height: view.frame.height + 10))
        image.contentMode = .scaleAspectFit
        image.set(.lMenuCart)
        view.addSubview(image)
        
        if let text = title {
            if fixLabel {
                let count: Int = (actions.count - 1) > 0 ? (actions.count - 1) : 1
                let margin: CGFloat = 32 + CGFloat(count * 30)
                
                let label = UILabel(frame: CGRect(x: 56, y: 0, width: view.frame.width  - (2 * margin), height: view.frame.height))
                label.text = text
                label.font = .appFont(17, .FONT_BOLD)
                label.textColor = titleColor
                label.textAlignment = .center
                image.removeFromSuperview()
                label.numberOfLines = 0
                view.addSubview(label)
            } else {
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width , height: view.frame.height))
                label.text = text
                label.font = .appFont(18, .FONT_BOLD)
                label.textColor = titleColor
                label.textAlignment = .center
                image.removeFromSuperview()
                view.addSubview(label)
            }
        }
        
        var leftMargin: CGFloat = 16
        if actions.contains(.back) {
            let buttonBack = UIButton(frame: CGRect(x: 10, y: -3, width: 34, height: view.frame.height + 6))
            buttonBack.set(.back)
            buttonBack.contentHorizontalAlignment = .center
            buttonBack.tag = HeaderAction.back.rawValue
            buttonBack.addTarget(self, action: selector, for: .touchUpInside)
            view.addSubview(buttonBack)
            leftMargin += buttonBack.frame.maxX
        }
        
        let count: Int = actions.count - 1
        let itemSize: CGFloat = 30
        let spacing: CGFloat = 12
        var actionsWidth: CGFloat = 16
        let starter: CGFloat = windowWidth - actionsWidth + 4
        if count > 0 {
            for i in 1 ... count {
                let buttonBack = UIButton(frame: CGRect(x: starter - ((itemSize + spacing) * CGFloat(i)), y: 0, width: itemSize, height: view.frame.height))
                buttonBack.set(actions[i])
                buttonBack.contentHorizontalAlignment = .center
                buttonBack.tag = actions[i].rawValue
                buttonBack.imageView?.tintColor = .white
                buttonBack.addTarget(self, action: selector, for: .touchUpInside)
                view.addSubview(buttonBack)
                actionsWidth += ((itemSize + spacing) * CGFloat(i))
            }
        }
        return view
    }
    

    func addButton(with options: [UIMetricOption], selector: Selector? = nil, _ target: Any? = nil) {
        let button = UIButton(options)
        if let sel = selector {
            button.addTarget(target ?? self, action: sel, for: .touchUpInside)
        }
        self.view.addSubview(button)
    }
    
    func addButton(_ options: UIMetricOption...) {
        self.view.addSubview(UIButton(options))
    }
    
    func button(_ options: UIMetricOption...) -> UIButton {
        return UIButton(options)
    }
    
    func createButton(_ options: UIMetricOption...) -> UIButton {
        let button = UIButton(options)
        self.view.addSubview(button)
        return button
    }
    
    func addLabel(_ options: UIMetricOption...) {
        self.view.addSubview(UILabel(options))
    }
    
    func createLabel(_ options: UIMetricOption...) -> UILabel {
        let label = UILabel(options)
        self.view.addSubview(label)
        return label
    }
    
    func label(_ options: UIMetricOption...) -> UILabel {
        return UILabel(options)
    }
    
}


