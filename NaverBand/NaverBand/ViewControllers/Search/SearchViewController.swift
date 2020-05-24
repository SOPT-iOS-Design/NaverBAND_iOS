//
//  SearchViewController.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/24.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var NewCollectionView: UICollectionView!
    @IBOutlet weak var PageCollectionView: UICollectionView!
    @IBOutlet weak var BandCollectionView: UICollectionView!
    
    // 데이터 임의로 넣기
    private var NewList: [New] = []
    override func viewDidLoad() {
        super.viewDidLoad()

      setNewList()
        NewCollectionView.delegate = self
        NewCollectionView.dataSource = self
     
    }
    
    private func setNewList(){
        let new1 = New(imageName: "imgNewband", title: "남도의들꽃세상")
        let new2 = New(imageName: "imgNewband", title: "남도의들꽃세상")
        let new3 = New(imageName: "imgNewband", title: "남도의들꽃세상")
        let new4 = New(imageName: "imgNewband", title: "남도의들꽃세상")
        let new5 = New(imageName: "imgNewband", title: "남도의들꽃세상")
        let new6 = New(imageName: "imgNewband", title: "남도의들꽃세상")
        
        NewList = [new1, new2, new3, new4, new5, new6]
    }
    
}

extension SearchViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCell.identifier, for: indexPath) as! NewCell
        return cell
    }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 12
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
            return CGSize(width: (collectionView.frame.width - 80) / 2, height: (collectionView.frame.height - 12)/2)
        }
    
    
}
