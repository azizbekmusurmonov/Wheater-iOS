//
//  BaseViewController.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

class BaseViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(onRightSwipe))
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }


    @objc func onRightSwipe(_ gesture: UISwipeGestureRecognizer) {
        if SharedManager.getDeveloperModeOn() {
            if gesture.direction == .right {
                let controller = RespondResultController()
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    
    
}
