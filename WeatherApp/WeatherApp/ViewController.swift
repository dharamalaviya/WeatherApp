//
//  ViewController.swift
//  WeatherApp
//
//  Created by DCS on 15/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let welcome:UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome to WeatherApp"
        lbl.font = UIFont(name: "Copperplate", size: 20.0)
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    private let login : UIButton = {
        let con = UIButton()
        con.setTitle("Go to Check Weather", for: .normal)
        con.addTarget(self, action: #selector(goto), for: .touchUpInside)
        con.setTitleColor(.white, for: .normal)
        con.layer.cornerRadius = 25
        con.backgroundColor = .init(red: 0.234, green: 0.289, blue: 0.294, alpha: 1)
        return con
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(welcome)
        view.addSubview(login)
        
        let bckimage = UIImageView(frame: UIScreen.main.bounds)
        bckimage.image = UIImage(named: "Weather1.jpg")
        bckimage.contentMode = UIView.ContentMode.scaleToFill
        self.view.insertSubview(bckimage, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.backgroundColor = .white
        welcome.frame = CGRect(x: 30, y:view.safeAreaInsets.top + 40,width: view.width - 60, height: 40)
        login.frame = CGRect(x: 30, y: welcome.bottom + 200, width: view.width - 60, height: 40)
    }
    
    
    @objc func goto()
    {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
    }

}

