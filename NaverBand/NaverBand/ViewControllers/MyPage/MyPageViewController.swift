//
//  MyPageViewController.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/24.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
    
    //private var newTableInformations: [NewTableInformation] = []
    
    @IBOutlet weak var NewTableView: UITableView!
    
    var NewNoticeDataSet = [NewNoticeData.NewNoticeDataClass]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.NewTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        //setnewTableInformations()
        NewTableView.dataSource = self
        NewTableView.delegate = self
        
        newnoticeData()
        
    }
    
//    private func setnewTableInformations(){
//
//        let cell1 = NewTableInformation(image: .cell1, title: "순위로 보는 요즘 핫한 맛집과 카페", subtitle: "내마음속에 저장각!")
//        let cell2 = NewTableInformation(image: .cell2, title: "바름이의 힐링되는 미소", subtitle: "귀엽고 깜찍한 무료 스티커가 잔뜩~")
//        let cell3 = NewTableInformation(image: .cell3, title: "생일날은 케익은 필수", subtitle: "더 맛있는 부드러운 치즈케이크")
//
//        newTableInformations = [cell1, cell2, cell3]
//    }
    
    func newnoticeData(){
        
        NewNoticeService.shared.NewNotice {
                
                response in
                
                switch response{
                case . success(let data):
                    self.NewNoticeDataSet = [] // 초기화
                    self.NewNoticeDataSet = data as!
                        [NewNoticeData.NewNoticeDataClass]
                    
                    self.NewTableView.reloadData()
                    
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

extension MyPageViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewNoticeDataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        guard let NewTableCell = tableView.dequeueReusableCell(withIdentifier: NewTableCell.identifier, for:
//            indexPath) as? NewTableCell else { return UITableViewCell() }
//        NewTableCell.setnewTableInformations(ImageName:newTableInformations[indexPath.row].image.getImageName(),title: newTableInformations[indexPath.row].title, subtitle: newTableInformations[indexPath.row].subtitle)
//        return NewTableCell
        
        let tablecell = tableView.dequeueReusableCell(withIdentifier: "NewTableCell",for:indexPath) as! NewTableCell
        
        let newCell = NewNoticeDataSet[indexPath.row]
        
        tablecell.TitleLabel.text = newCell.noticeTitle
        tablecell.subTitleLabel.text = newCell.noticeSub
        
        let urlStr = newCell.noticeThumbnail
        
        tablecell.Img.kf.setImage(with: URL(string: urlStr))
        
        print(tablecell)
        
        return tablecell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {return 102 }
}


