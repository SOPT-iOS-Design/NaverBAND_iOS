//
//  SearchViewController.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/25.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet var subjectSearchBtns: [UIButton]!
    @IBOutlet weak var newBandCollectionView: UICollectionView!
    
    var newBandList: [Band] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBtns()
        newBandCollectionView.delegate = self
        newBandCollectionView.dataSource = self
    }
    
    // new band datas
    private func setNewBands() -> Void {
        let band1 = Band(bandImgName: "imgNewband", bandName: "남도의들꽃세상")
        let band2 = Band(bandImgName: "imgNewband2", bandName: "자전거타기")
        let band3 = Band(bandImgName: "imgNewband3", bandName: "국내,해외 맛집 모음")
        let band4 = Band(bandImgName: "imgNewband4", bandName: "습관과일상")
        let band5 = Band(bandImgName: "imgNewband5", bandName: "여행")
        let band6 = Band(bandImgName: "imgNewband6", bandName: "나이키")
        let band7 = Band(bandImgName: "imgNewband", bandName: "남도의들꽃세상")
        let band8 = Band(bandImgName: "imgNewband2", bandName: "자전거타기")
        let band9 = Band(bandImgName: "imgNewband3", bandName: "국내,해외 맛집 모음")
        
        newBandList = [band1, band2, band3, band4, band5, band6, band7, band8, band9]
    }
    // Btn settings
    private func setBtns() -> Void {
        for btn in subjectSearchBtns {
            btn.backgroundColor = .naver
            //btn.titleLabel?.font = UIFont(name: "NotoSansCJKkr-Bold", size: 12.0)
            // Zeplin과 다른 부분
            btn.layer.cornerRadius = 14
            
        }
    }
}


extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newBandList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let newBandCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewBandCell.identifier, for: indexPath) as? NewBandCell else { return UICollectionViewCell() }
        newBandCell.set(newBandList[indexPath.row])
        return newBandCell
    }
    
    
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionView.frame)
        return CGSize(width: (collectionView.frame.width-10) / 2, height: (collectionView.frame.height-12) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}

