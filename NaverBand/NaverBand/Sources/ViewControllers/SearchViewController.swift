//
//  SearchViewController.swift
//  NaverBand
//
//  Created by 김성은 on 2020/05/28.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var newCollectionView: UICollectionView!
    @IBOutlet weak var recommendPageCollectionView: UICollectionView!
    @IBOutlet weak var recommendBandCollectionView: UICollectionView!
    
    var newList: [NewBand] = []
    var pageList: [RecommendPage] = []
    var bandList: [RecommendBand] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let radius = button1.frame.height / 2
        button1.layer.cornerRadius = radius
        button2.layer.cornerRadius = radius
        button3.layer.cornerRadius = radius
        button4.layer.cornerRadius = radius
        button5.layer.cornerRadius = radius
        button6.layer.cornerRadius = radius
        button7.layer.cornerRadius = radius
        button8.layer.cornerRadius = radius
        
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 29, height: searchTextField.frame.height))
        searchTextField.leftView = padding
        searchTextField.leftViewMode = .always
        
        initData()
        
        newCollectionView.dataSource = self
        newCollectionView.delegate = self
        recommendPageCollectionView.dataSource = self
        recommendPageCollectionView.delegate = self
        recommendBandCollectionView.dataSource = self
        recommendBandCollectionView.delegate = self
    }
    
    func initData() {
        let new1 = NewBand(imageName: "imgNewband", bandName: "남도의들꽃세상")
        let new2 = NewBand(imageName: "imgNewband2", bandName: "자전거타기")
        let new3 = NewBand(imageName: "imgNewband3", bandName: "국내, 해외 맛집 모음")
        let new4 = NewBand(imageName: "imgNewband5", bandName: "습관과일상")
        let new5 = NewBand(imageName: "imgNewband4", bandName: "해외여행 정보 나눔")
        let new6 = NewBand(imageName: "imgNewband6", bandName: "나이키 직구")
        newList = [new1, new2, new3, new4, new5, new6]
        
        let page1 = RecommendPage(imageName: "imgPage", title: "반려동물가이드", comment: "동물 좋아하고 정보소통해요")
        let page2 = RecommendPage(imageName: "imgPage2", title: "육아휴직툰", comment: "육아휴직한 아빠의 일상을 그리고 있습니다.")
        let page3 = RecommendPage(imageName: "imgPage3", title: "1일1책 성장읽기", comment: "1일 1독, 매일한권의 책을 만나세요!")
        let page4 = RecommendPage(imageName: "imgPage4", title: "초보를 위한 포켓몬 공략집", comment: "포켓몬 공략 보고 포켓몬마스터 되자!")
        let page5 = RecommendPage(imageName: "imgPage5", title: "삐약삐약병아리", comment: "병아리 처음 키워보시는 분들 들어오세요")
        let page6 = RecommendPage(imageName: "imgPage6", title: "헬스정보나눔", comment: "모두 운동합시다")
        pageList = [page1, page2, page3, page4, page5, page6]
        
        let band1 = RecommendBand(imageName: "btnRecommendimg", title: "강아지를 사랑하는 사람 모여라", number: 99999, id: "neymar123")
        let band2 = RecommendBand(imageName: "btnRecommend2", title: "해외축구갤러리", number: 97482, id: "soccer456")
        let band3 = RecommendBand(imageName: "btnRecommend3", title: "이케아 인테리어 추천", number: 24367, id: "ikealover")
        bandList = [band1, band2, band3]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.newCollectionView: return 6
        case self.recommendPageCollectionView: return 6
        default: return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case self.newCollectionView:
            guard let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewBandCell", for: indexPath) as? NewBandCell else { return UICollectionViewCell() }
            newCell.setNewBandInfo(imageName: newList[indexPath.row].imageName, name: newList[indexPath.row].bandName)
            return newCell
            
        case self.recommendPageCollectionView:
            guard let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendPageCell", for: indexPath) as? RecommendPageCell else { return UICollectionViewCell() }
            pageCell.setPageInfo(imageName: pageList[indexPath.row].imageName, title: pageList[indexPath.row].title, comment: pageList[indexPath.row].comment)
            return pageCell
            
        default:
            guard let bandCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendBandCell", for: indexPath) as? RecommendBandCell else { return UICollectionViewCell() }
            bandCell.setBandInfo(imageName: bandList[indexPath.row].imageName, title: bandList[indexPath.row].title, info: bandList[indexPath.row].info)
            return bandCell
        }
    }
    
    // CollectionView ContentInset 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    // CollectionView Cell 위, 아래 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case self.newCollectionView: return 15
        case self.recommendPageCollectionView: return 14
        default: return 20
        }
    }
    
    // CollectionView Cell 좌, 우 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case self.newCollectionView: return 12
        case self.recommendPageCollectionView: return 26
        default: return 20
        }
    }
}

