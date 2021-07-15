//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by DCS on 15/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    var CityName = ""
    var image = ""
    private var cityarray = [CityDetail]()
    
    private let searchbar = UISearchBar()
    
    private let statusLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "", size: 40.0)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 20
        return lbl
    }()
    
    private let uvLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "", size: 40.0)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 20
        return lbl
    }()
    
    private let cloudLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "", size: 40.0)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 20
        return lbl
    }()
    
    private let windLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "", size: 40.0)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 20
        return lbl
    }()
    
    private let cityStateLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "", size: 40.0)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 20
        return lbl
    }()
    
    private let tempLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "Copperplate", size: 90.0)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 20
        return lbl
    }()
    
    
    private let lastUpdateLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "", size: 40.0)
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.backgroundColor = .gray
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 20
        return lbl
    }()
    private let updateLabel:UILabel = {
        let lbl = UILabel()
        lbl.text = "Last Update"
        lbl.font = UIFont(name: "", size: 40.0)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 20
        return lbl
    }()
    
    private let icon:UIImageView = {
        let imgv = UIImageView()
        imgv.layer.cornerRadius = 5
        imgv.clipsToBounds = true
        return imgv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(statusLabel)
        view.addSubview(tempLabel)
        view.addSubview(cityStateLabel)
        view.addSubview(lastUpdateLabel)
        view.addSubview(updateLabel)
        view.addSubview(icon)
        view.addSubview(windLabel)
        view.addSubview(cloudLabel)
        view.addSubview(uvLabel)
        
        
        let bckimage = UIImageView(frame: UIScreen.main.bounds)
        bckimage.image = UIImage(named: "Weather3.jpg")
        bckimage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(bckimage, at: 0)
        
        
        CityName = UserDefaults.standard.value(forKey: "name") as! String
        getdata(name: CityName)
        
        view.addSubview(searchbar)
        searchbar.delegate =  self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchbar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 50)
        icon.frame = CGRect(x: 20, y: searchbar.bottom + 10, width: 64, height: 64)
        statusLabel.frame = CGRect(x: 40, y: searchbar.bottom + 50, width: view.width - 60, height: 50)
        cityStateLabel.frame = CGRect(x: 70, y: statusLabel.bottom + 5, width: view.width - 130, height: 30)
        tempLabel.frame = CGRect(x: 40, y: cityStateLabel.bottom + 30, width: view.width - 80, height: 100)
        
        windLabel.frame = CGRect(x: 40, y: tempLabel.bottom + 30, width: view.width - 80, height: 30)
        cloudLabel.frame = CGRect(x: 40, y: windLabel.bottom + 1, width: view.width - 80, height: 30)
        uvLabel.frame = CGRect(x: 40, y: cloudLabel.bottom + 1, width: view.width - 80, height: 30)
        updateLabel.frame = CGRect(x: 40, y: uvLabel.bottom + 30, width: view.width - 80, height: 30)
        lastUpdateLabel.frame = CGRect(x: 70, y: updateLabel.bottom + 5, width: view.width - 130, height: 30)
        
    }
    
    func getdata(name:String)
    {
        self.CityName = name.replacingOccurrences(of: " ", with: "")
        cityarray = ApiHandler.shared.searchcity(with: name)
        for i in cityarray{
            print(i.location.country)
            statusLabel.text = i.current.condition.text
            cityStateLabel.text = i.location.name+","+i.location.country
            tempLabel.text = String(i.current.temp_c)+" C"
            image = i.current.condition.icon
            image = image.replacingOccurrences(of: "//cdn.weatherapi.com/", with: "")
            icon.image = UIImage(named: image)
            lastUpdateLabel.text = i.current.last_updated
            windLabel.text = "Wind mph : " + String(i.current.wind_mph)
            uvLabel.text = "UltraViolet : " + String(i.current.uv)
            cloudLabel.text = "Cloud : " + String(i.current.cloud)
            
        }
    }

}
extension WeatherVC:UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searching..")
        view.endEditing(true)
        getdata(name: searchbar.text!)
    }
}
