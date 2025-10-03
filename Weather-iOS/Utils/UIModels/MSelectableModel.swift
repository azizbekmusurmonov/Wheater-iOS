//
//  MSelectableModel.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Foundation

protocol MSelectableModel : MObjectModel {
    var selected: Bool {get set}
    
}

extension Array where Element : MSelectableModel {
    
    mutating func selectDefault() {
        self.unSelectAll()
        if self.count > 0 {
            self[0].selected = true
        }
    }
    
    mutating func unSelectAll() {
        for i in 0 ..< self.count {
            self[i].selected = false
        }
    }
    
    mutating func update(with model: MSelectableModel) {
        for i in 0 ..< self.count {
            if self[i].objectId == model.objectId {
                self[i].selected = model.selected
            }
        }
    }

    
    //MARK: - single check
    mutating func select(at index: Int) {
        self.unSelectAll()
        if self.count > index {
            self[index].selected = true
        }
    }
    
    mutating func select(item: MSelectableModel) {
        self.unSelectAll()
        for i in 0 ..< self.count {
            self[i].selected = (self[i].objectId == item.objectId)
        }
    }
    
    func selectedIndex() -> Int {
        for i in 0 ..< self.count {
            if self[i].selected {
                return i
            }
        }
        return 0
    }
    
    mutating func updateSelect(with model: MSelectableModel) {
        self.unSelectAll()
        for i in 0 ..< self.count {
            if self[i].objectId == model.objectId {
                self[i].selected = model.selected
            }
        }
    }
    
    //MARK: - multiple check
    mutating func check(at index: Int) {
        if self.count > index {
            self[index].selected = true
        }
    }
    
    mutating func check(item: MSelectableModel) {
        for i in 0 ..< self.count {
            self[i].selected = (self[i].objectId == item.objectId)
        }
    }
    
    func checkedIndexes() -> [Int] {
        var array = [Int]()
        for i in 0 ..< self.count {
            if self[i].selected {
                array.append(i)
            }
        }
        return array
    }
    
    mutating func updateCheck(with model: MSelectableModel) {
        for i in 0 ..< self.count {
            if self[i].objectId == model.objectId {
                self[i].selected = model.selected
            }
        }
    }
    
    
    
    
}
