//
//  RespondResultController.swift
//  XalqBank
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

class RespondResultController: BaseViewController{
    
    var heightForRowAt: CGFloat = 0
    
    let tableView = UITableView()
    
    var model: SharedResponse?
    
    func setUI(){
        
        let navElement = self.createActinableSectionHeader(LanguageKey.titleLog.text, [.back, .share], #selector(presnav(_ :)), height: universalHeight(60), UIColor.colorTextDark, fixLabel: true)
        self.view.addSubview(navElement)
        
        tableView.frame = CGRect(x: 0, y: navElement.frame.maxY, width: windowWidth, height: windowHeight - navElement.frame.maxY)
        
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.view.addSubview(tableView)
    }
    
    @objc func presnav(_ sender: UIButton) {
        let action = HeaderAction(rawValue: sender.tag)
        switch action {
        case .back:
            self.navigationController?.popViewController(animated: true)
        case .share:
            if let shared = self.model {
                self.onShare(shared)
            }
            break
        
        default : break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func onShare(_ model: SharedResponse) {
        let a = "\(model.formattedData)"
    
        let objectsToShare = [a] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [.airDrop , .message, .copyToPasteboard, .postToFacebook, .print]
        self.present(activityVC, animated: true, completion: nil)
    }
}

extension RespondResultController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = model else { return UITableViewCell()}
        
        let cell = RespondResultCell()
        cell.clearAllBackground()
        cell.setUI(model: model, dataHeight: model.formattedData.height(withConstrainedWidth: windowWidth - universalHeight(40), font: .appFont(16)))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let model = model else { return 0}
        let heightForRowAt = model.formattedData.height(withConstrainedWidth: windowWidth - universalHeight(40), font: .appFont(16)) + universalHeight(40)
        return universalHeight(heightForRowAt)
    }
}
