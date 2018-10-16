//
//  ViewController.swift
//  WeatherApp
//
//  Created by Student on 09/10/2018.
//  Copyright © 2018 Maria Sosenkiewicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let weather = WeatherGetter()
        weather.getWeather(city: 44418)
    }

}

