//
//  CountryListViewModel.swift
//  ___PROJECTNAME___    
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit


class CountryListViewModel {
        
    private var countryList = [MCountry]()
    
    private var workerCountryList = [MCountry]()
    
    private var delegate: CountryListViewProtocol?
    
    init(_ delegate: CountryListViewProtocol) {
        self.delegate = delegate
    }
    
    
    func getData() {
        self.getAllCountries()
    }
    
    func search(_ text: String) {
        self.workerCountryList = self.countryList.search(text.lowercased())
        self.delegate?.reloadData()
    }
    
    private func getAllCountries() {
        self.delegate?.showLoader(true)
        // loading
        ApiClient.getAllCountries { countries in
            // loadinng
            self.delegate?.showLoader(false)
            if let all = countries {
                self.countryList.append(contentsOf: all)
                self.workerCountryList = self.countryList
            }
            self.delegate?.reloadData()
        }
        
    }
    
    
    func numberOfRows(_ section: Int) -> Int {
        
        switch section {
        case 0 : return self.countryList.count
        default : return 0
        }
        
        return self.workerCountryList.count
    }
    
    func itemFor(_ indexPath: IndexPath) -> MCountry {
        return self.workerCountryList[indexPath.row]
    }
    
    
}


extension Array where Element == MCountry {
    
    func search(_ text: String) -> [MCountry] {
        var set = Set<String>()
        var namePrefix = [MCountry]()
        var nameContains = [MCountry]()
        var capitalPrefix = [MCountry]()
        var capitalContains = [MCountry]()
        
        for item in self {
            let name = (item.name?.common ?? item.name?.official ?? "").lowercased()
            
            let capital = (item.capital?.first ?? "").lowercased()
            
            if name.hasPrefix(text) {
                if !set.contains(item.countryId) {
                    namePrefix.append(item)
                    set.insert(item.countryId)
                }
            } else if name.contains(text) {
                if !set.contains(item.countryId) {
                    nameContains.append(item)
                    set.insert(item.countryId)
                }
            } 
            else if capital.hasPrefix(text) {
                if !set.contains(item.countryId) {
                    capitalPrefix.append(item)
                    set.insert(item.countryId)
                }
            } else if capital.contains(text) {
                if !set.contains(item.countryId) {
                    capitalContains.append(item)
                    set.insert(item.countryId)
                }
            }
        }
        
        var result = [MCountry]()
        result.append(contentsOf: namePrefix.csorted())
        result.append(contentsOf: nameContains.csorted())
        result.append(contentsOf: capitalPrefix.csorted())
        result.append(contentsOf: capitalContains.csorted())
        
        return result
    }
    
    func csorted() -> [MCountry] {
        var result: [MCountry] = self
        for i in 0 ..< result.count {
            for j in (i + 1) ..< result.count {
                if result[i].countryName > result[j].countryName {
                    result.swapAt(i, j)
                }
            }
        }
        return result
    }
    
}
