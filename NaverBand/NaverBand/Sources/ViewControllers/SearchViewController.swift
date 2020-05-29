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
    @IBOutlet weak var recommendPageCollectionView: UICollectionView!
    @IBOutlet weak var recommendBandCollectionView: UICollectionView!
    
    var newBandList: [NewBand] = []
    var recommendPageList: [RecommendPage] = []
    var recommendBandList: [RecommendBand] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtns()
        setNewBands()
        newBandCollectionView.delegate = self
        newBandCollectionView.dataSource = self
        recommendPageCollectionView.delegate = self
        recommendPageCollectionView.dataSource = self
        recommendBandCollectionView.delegate = self
        recommendBandCollectionView.dataSource = self
    }
    
    // new band datas
    private func setNewBands() -> Void {
        let band1 = NewBand(bandImgName: "imgNewband", bandName: "남도의들꽃세상")
        let band2 = NewBand(bandImgName: "imgNewband2", bandName: "자전거타기")
        let band3 = NewBand(bandImgName: "imgNewband3", bandName: "국내,해외 맛집 모음")
        let band4 = NewBand(bandImgName: "imgNewband4", bandName: "습관과일상")
        let band5 = NewBand(bandImgName: "imgNewband5", bandName: "여행")
        let band6 = NewBand(bandImgName: "imgNewband6", bandName: "나이키")
        let band7 = NewBand(bandImgName: "imgNewband", bandName: "남도의들꽃세상")
        let band8 = NewBand(bandImgName: "imgNewband2", bandName: "자전거타기")
        let band9 = NewBand(bandImgName: "imgNewband3", bandName: "국내,해외 맛집 모음")
        
        newBandList = [band1, band2, band3, band4, band5, band6, band7, band8, band9]
        
        let rPage1 = RecommendPage(recommendPageImgName: "imgPage", name: "반려동물가이드", detail: "동물 좋아하고 정보소통해요")
        let rPage2 = RecommendPage(recommendPageImgName: "imgPage", name: "육아휴직툰", detail: "육아휴직한 아빠의 일상을 그리고 있습니다.")
        let rPage3 = RecommendPage(recommendPageImgName: "imgPage", name: "1일1책 성장읽기", detail: "1일 1독, 매일한권의 책을 만나세요!")
        let rPage4 = RecommendPage(recommendPageImgName: "imgPage", name: "반려동물가이드", detail: "동물 좋아하고 정보소통해요")
        let rPage5 = RecommendPage(recommendPageImgName: "imgPage", name: "육아휴직툰", detail: "육아휴직한 아빠의 일상을 그리고 있습니다.")
        let rPage6 = RecommendPage(recommendPageImgName: "imgPage", name: "1일1책 성장읽기", detail: "1일 1독, 매일한권의 책을 만나세요!")
        let rPage7 = RecommendPage(recommendPageImgName: "imgPage", name: "반려동물가이드", detail: "동물 좋아하고 정보소통해요")
        let rPage8 = RecommendPage(recommendPageImgName: "imgPage", name: "육아휴직툰", detail: "육아휴직한 아빠의 일상을 그리고 있습니다.")
        let rPage9 = RecommendPage(recommendPageImgName: "imgPage", name: "1일1책 성장읽기", detail: "1일 1독, 매일한권의 책을 만나세요!")
        
        recommendPageList = [rPage1, rPage2, rPage3, rPage4, rPage5, rPage6, rPage7, rPage8, rPage9]
        
        let rBand1 = RecommendBand(bandImgName: "btnRecommendimg", name: "강아지를 사랑하는 사람 모여라", detail: "멤버 99,999 | neymar123")
        let rBand2 = RecommendBand(bandImgName: "btnRecommendimg", name: "강아지를 사랑하는 사람 모여라", detail: "멤버 99,999 | neymar123")
        let rBand3 = RecommendBand(bandImgName: "btnRecommendimg", name: "강아지를 사랑하는 사람 모여라", detail: "멤버 99,999 | neymar123")
        let rBand4 = RecommendBand(bandImgName: "btnRecommendimg", name: "강아지를 사랑하는 사람 모여라", detail: "멤버 99,999 | neymar123")
        
        recommendBandList = [rBand1, rBand2, rBand3, rBand4]
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
//MARK: - DataSource
extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == newBandCollectionView {
            return newBandList.count
        } else if collectionView == recommendPageCollectionView {
            return recommendPageList.count
        } else {
            return recommendBandList.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == newBandCollectionView {
            guard let newBandCell = collectionView.dequeueReusableCell(withReuseIdentifier: NewBandCell.identifier, for: indexPath) as? NewBandCell else { return UICollectionViewCell() }
            newBandCell.set(newBandList[indexPath.row])
            return newBandCell
        } else if collectionView == recommendPageCollectionView {
            guard let recommendPageCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendPageCell.identifier, for: indexPath) as? RecommendPageCell else { return UICollectionViewCell() }
            recommendPageCell.set(recommendPageList[indexPath.row])
            return recommendPageCell
        } else {
            guard let recommendBandCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendBandCell.identifier, for: indexPath) as? RecommendBandCell else { return UICollectionViewCell() }
            recommendBandCell.set(recommendBandList[indexPath.row])
            return recommendBandCell
        }
    }
    
}

//MARK: - DelegateFlowLayout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        
        if collectionView == newBandCollectionView {
            return CGSize(width: 147, height: 48)
        } else if collectionView == recommendPageCollectionView {
            return CGSize(width: 312, height: 80)
        } else {
            return CGSize(width: 254, height: 151)
        }
        
    }
    
    // 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
    }
    // 좌,우
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == newBandCollectionView {
            return 15
        } else if collectionView == recommendPageCollectionView {
            return 14
        } else {
            return 20
        }
        
    }
    // 위 아래
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == newBandCollectionView {
            return 12
        } else if collectionView == recommendPageCollectionView {
            return 26
        } else {
            return 0
        }
    }
    
}
