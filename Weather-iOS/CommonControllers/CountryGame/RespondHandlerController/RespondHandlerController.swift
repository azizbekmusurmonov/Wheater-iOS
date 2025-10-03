//
//  RespondHandlerController.swift
//  XalqBank
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

class RespondHandlerController: ViewController{
    
    let tableView = UITableView()
    
    var model = [SharedResponse]()
    
    func setUI(){
        let navElement = self.createActinableSectionHeader(LanguageKey.titleLog.text, [.back, .clear], #selector(presnav(_ :)), height: universalHeight(60), UIColor.colorTextDark, fixLabel: true)
        self.view.addSubview(navElement)
        
        tableView.frame = CGRect(x: 0, y: navElement.frame.maxY, width: windowWidth, height: windowHeight - navElement.frame.maxY)
        
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.view.addSubview(tableView)
    }
    
    @objc func presnav(_ sender: UIButton) {
        switch sender.tag {
        case HeaderAction.back.rawValue :
            self.navigationController?.popViewController(animated: true)
        case HeaderAction.clear.rawValue :
            SharedManager.removeResponses()
            self.model = SharedManager.getResponses()
            self.tableView.reloadData()
            
        default : break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = SharedManager.getResponses()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(onConnected), name: .notificationApiLogSharedDataGot, object: nil)
    }
    
    @objc func onConnected(_ notification: Notification) {
        self.model = SharedManager.getResponses()
        tableView.reloadData()
    }
}

extension RespondHandlerController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RespondHandlerCell()
        cell.clearAllBackground()
        cell.setUI(model: model[indexPath.row])
        cell.onAction = {
            let heightForRowAt = self.model[indexPath.row].data.height(withConstrainedWidth: windowWidth - universalHeight(40), font: .appFont(16))
            let viewController = RespondResultController()
            viewController.heightForRowAt = heightForRowAt
            viewController.model = self.model[indexPath.row]
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        cell.onLongAction = { model in
            self.onShare(model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return universalHeight(70)
    }
    
    private func onShare(_ model: SharedResponse) {
        let a = "\(model.formattedData)"
    
        let objectsToShare = [a] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [.airDrop , .message, .copyToPasteboard, .postToFacebook, .print]
        self.present(activityVC, animated: true, completion: nil)
    }
}
