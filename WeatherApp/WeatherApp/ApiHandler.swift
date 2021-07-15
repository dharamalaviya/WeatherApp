//
//  ApiHandler.swift
//  WeatherApp
//
//  Created by DCS on 15/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
class ApiHandler{
    
    static let shared = ApiHandler()
    
    func searchcity(with name:String) -> [CityDetail]{
        
       if let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=74d5934c2111438fabf53416211507&q=\(name)")
        {
            
            if let data = try? Data(contentsOf: url)
            {
                
                let decoder = JSONDecoder()
                
                if let JSONData = try? decoder.decode(CityDetail.self,from: data)
                {
                    print(JSONData.current.condition)
                    return [JSONData]
                }
            }
        }
        return [CityDetail]()
    }
}
