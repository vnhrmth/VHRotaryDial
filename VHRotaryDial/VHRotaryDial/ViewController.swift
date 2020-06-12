//
//  ViewController.swift
//  VHRotaryDial
//
//  Created by Vinay on 12/06/20.
//  Copyright © 2020 com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private let cellId = "CellId"
    private let numberDialArray = ["1","2","3","4","5","6","7","8","9","0"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "NumbersViewCell", bundle: nil), forCellWithReuseIdentifier:cellId)
        
        self.collectionView.contentInset = UIEdgeInsets(top: 0,left: 0,bottom: 200,right: 0)
        self.collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0,left: 0,bottom: 200,right: 0)

//        self.collectionView.contentSize
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberDialArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NumbersViewCell
        
        cell.numberText.text = numberDialArray[indexPath.row]
        return cell
    }
}

