//
//  RootViewController.swift
//  WeatherApp
//
//  Created by Student on 23/10/2018.
//  Copyright © 2018 Maria Sosenkiewicz. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    enum RootViewType: Int {
        case now = 0
        case day
        case week
        
        static var count: Int {
            return RootViewType.week.rawValue + 1
        }
    }
    
    private func setupView() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "someCell")
    }
    // MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension RootViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Dequeue Reusable Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "someCell", for: indexPath)
        
        // Configure Cell
        cell.contentView.backgroundColor = .green
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RootViewType.count
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    
}

