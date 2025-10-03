//
//  CountryListViewController.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit

class CountryListViewController: UIViewController {

    // tableview scrollview collectionview
    internal var tableView: UITableView!
    
    internal var viewModel: CountryListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .colorBackground
        self.viewModel = CountryListViewModel(self)
        self.initViews()
        
    }
    

    private func initViews() {
        self.view.backgroundColor = .colorBackground
        
       
        
        self.tableView = UITableView(frame: CGRect(x: 0, y: 0, width: windowWidth, height: windowHeight ), style: .grouped)
        self.tableView.backgroundColor = .clear
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.separatorStyle = .none
    
        self.view.addSubview(self.tableView)
        
        self.viewModel.getData()
    }

}


extension CountryListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count =  self.viewModel.numberOfRows(section)
        
        self.tableView.backgroundView = (count > 0) ? nil : UIView()
       
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        return  self.cellForItem(indexPath)
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
    internal func cellForItem(_ indexPath: IndexPath) -> UITableViewCell {
        let model = self.viewModel.itemFor(indexPath)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "UITableViewCell")
        cell.clearAllBackground()
        cell.textLabel?.text = model.countryName
        cell.detailTextLabel?.text = model.capitalName
        return cell
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ScreenshotShield.shared.activateShield()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ScreenshotShield.shared.deactivateShield()
    }
  
}

extension CountryListViewController : CountryListViewProtocol {
    
    func showLoader(_ show: Bool) {
        if show {
            
        }
    }
    
   
    func reload(section: [Int]) {
        
    }
    
    func reload(indexPath: [IndexPath]) {
        
    }
    
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func reload(section: Int) {
        self.tableView.reloadSections([section], with: .fade)
    }
    
    
}
