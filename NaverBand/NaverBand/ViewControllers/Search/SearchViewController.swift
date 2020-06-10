//
//  SearchViewController.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/24.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {
    
    @IBOutlet var TopicButton: [UIButton]!
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var NewCollectionView: UICollectionView!
    @IBOutlet weak var PageCollectionView: UICollectionView!
    @IBOutlet weak var BandCollectionView: UICollectionView!
    
    // 배열에 데이터 담아두기
    var NewList: [New] = []
    var PageList: [Page] = []
    var BandList : [Band] = []
    
    var NewBandDataSet = [NewBandData.NewBandDataClass]()
    var RecommendPageDataSet = [RecommendPageData.RecommendPageDataClass]()
    var RecommendBandDataSet = [RecommendBandData.RecommendBandDataClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addKeyboardObserver()
        searchText.delegate = self
        
        RoundBtn()
        
        //NewCollectionView.reloadData()
        
        //setNewList()
        NewCollectionView.delegate = self
        NewCollectionView.dataSource = self
        
        // setPageList()
        PageCollectionView.delegate = self
        PageCollectionView.dataSource = self
        
        //setBandList()
        BandCollectionView.delegate = self
        BandCollectionView.dataSource = self
        
        newbandData()
        recommendpageData()
        recommendbandData()
        
    }
    // 버튼 라운드 넣기
    func RoundBtn(){
        
        for btn in TopicButton{
            
            btn.layer.cornerRadius = 14
            btn.layer.masksToBounds = true
        }
        
    }
    
    func newbandData(){
        
        NewBandService.shared.NewBand {
            
            response in
            
            switch response{
            case . success(let data):
                self.NewBandDataSet = []
                self.NewBandDataSet = data as!
                    [NewBandData.NewBandDataClass]
                
                self.NewCollectionView.reloadData()
                
                print(self.NewBandDataSet)
                
            case.networkFail:
                print("error")
                print("실패 광광광")
                
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            }
            
        }
    }
    
    func recommendpageData(){
        
        RecommendPageService.shared.RecommendPage {
            
            response in
            
            switch response{
            case . success(let data):
                self.RecommendPageDataSet = [] // 초기화
                self.RecommendPageDataSet = data as!
                    [RecommendPageData.RecommendPageDataClass]
                
                self.PageCollectionView.reloadData()
                
                print(self.RecommendPageDataSet)
                
            case.networkFail:
                print("error")
                print(" recommendpage 실패")
                
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            }
            
        }
    }
    
    func recommendbandData(){
        
        RecommendBandService.shared.RecommendBand {
            
            response in
            
            switch response{
            case . success(let data):
                self.RecommendBandDataSet = [] // 초기화
                self.RecommendBandDataSet = data as!
                    [RecommendBandData.RecommendBandDataClass]
                
                self.BandCollectionView.reloadData()
                
                print(self.RecommendBandDataSet)
                
            case.networkFail:
                print("error")
                print(" reco Band 실패")
                
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            }
            
        }
        
    }
    

}

extension SearchViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    // 각각의 collection view별로 분기 처리
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.NewCollectionView{ return NewList.count}
        else if collectionView == self.PageCollectionView{return PageList.count}
        
        return BandList.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.NewCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCell",for:indexPath) as! NewCell
            
            let newCell = NewBandDataSet[indexPath.row]
            
            cell.Label.text = newCell.bandName
            
            let urlStr = newCell.bandImg
            
            cell.NewImg.kf.setImage(with: URL(string: urlStr))
            
            print(newCell)
            
            return cell
        }
            
        else if collectionView == self.PageCollectionView{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PageCell",for:indexPath) as! PageCell
            
            let pageCell = RecommendPageDataSet[indexPath.row]
            
            cell.TitleLabel.text = pageCell.pageName
            cell.subTitleLabel.text = pageCell.pageDetail
            
            let urlStr = pageCell.pageImg
            
            cell.PageImg.kf.setImage(with: URL(string: urlStr))
            
            return cell
            
        }
            
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BandCell",for:indexPath) as! BandCell
            
            let bandCell = RecommendBandDataSet[indexPath.row]
            
            cell.titleLabel.text = bandCell.bandName
            cell.numberLabel.text = bandCell.bandNumOfMember
            cell.nameLabel.text = bandCell.userNickname
            
            let urlStr = bandCell.bandImg
            
            cell.BandImg.kf.setImage(with: URL(string: urlStr))
            
            return cell
        }
        
    }
    
    
    // collectionView Cell의 "위치" 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == self.NewCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
        }
            
        else if collectionView == self.PageCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 14)
        }
            
        else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        }
    }
    
    
    // collectionVeiw Cell의 "크기" 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.NewCollectionView{
            return CGSize(width: (collectionView.frame.width - 70) / 2, height: (collectionView.frame.height - 12)/2)
        }
        else if collectionView == self.PageCollectionView{
            return CGSize(width: (collectionView.frame.width - 44), height: (collectionView.frame.height - 52)/3)
        }
            
        else{
            return CGSize(width: (collectionView.frame.width - 120), height: (collectionView.frame.height))
        }
    }
}

// 검색 클릭시 키보드 생성 + background 클릭시 키보드 제거
extension SearchViewController:UITextFieldDelegate {
    
    private func addKeyboardObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func closeKeyboardObserver(){
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.searchText!.transform = .init(translationX: 0, y: 0)
        })
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.searchText!.transform = .identity
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
