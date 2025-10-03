//
//  ViewController.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

//base super controller
class ViewController: UIViewController {

    //
        
    private var indicator : UIActivityIndicatorView!
    
    var menu : [MenuOptionType] = [.accept, .cancel, .done, .done, .new]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        if #available(iOS 13.0, *) {
            self.indicator = UIActivityIndicatorView(style: .medium)
        } else {
            self.indicator = UIActivityIndicatorView(style: .gray)
        }
        self.view.addSubview(self.indicator)
        
        
        
        
        
        
//        self.present(self.alert(title: "Warning"), animated: true) { action in
//            if action == .done {
//                
//            }
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //send analytics
    }
    
    
    func handleLoader(_ show: Bool) {
        if show {
            self.indicator.startAnimating()
        } else {
            self.indicator.stopAnimating()
        }
    }
    
}


enum MenuOptionType  {
    
    case cancel
    case ok
    case accept
    case go
    case delete
    case done
    case new
    
    var title: String {
        
        return ""
    }
    
}
