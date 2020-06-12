//
//  MyPageViewController.swift
//  NaverBand
//
//  Created by 김성은 on 2020/05/28.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    var noticeList: [Notice] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        loadNoticeData()
        //setNewsData()
    }
    
    /*func setNewsData() {
        let news1 = News(imageName: "icPhoto1", title: "순위로 보는 요즘 핫한 맛집과 카페", subTitle: "내마음속에 저장각", pageName: "추천 페이지 <내맘대로 정하는 순위>")
        let news2 = News(imageName: "icPhoto2", title: "바름이의 힐링되는 미소", subTitle: "귀엽고 깜찍한 무료 스티커가 잔뜩~", pageName: "추천 페이지 <내맘대로 정하는 순위>")
        let news3 = News(imageName: "icPhoto3", title: "생일날은 케익은 필수", subTitle: "더 맛있는 부드러운 치즈케이크", pageName: "추천 페이지 <내맘대로 정하는 순위>")
        
        newsList = [news1, news2, news3]
    }*/
    
    func loadNoticeData() {
        NoticeService.shared.notice { networkResult in
            switch networkResult {
            case .success(let data):
                guard let data = data as? [Notice] else { return }
                //print(data[0].band_name)
                self.noticeList = data
                //print(self.newList)
                self.newsTableView.reloadData()
                
            case .requestErr(let message): print("requestErr: \(message)")
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
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

extension MyPageViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return noticeList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else { return UITableViewCell() }
        
        let url = URL(string: noticeList[indexPath.row].notice_thumbnail)
        //print(url!)
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        newsCell.newsImageView.image = image
                    }
                }
            }
        }
        newsCell.titleLabel.text = noticeList[indexPath.section].notice_title
        newsCell.subtitleLabel.text = noticeList[indexPath.section].notice_sub
        newsCell.pageNameLabel.text = "여기 뭐더라.."
        
        return newsCell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        //if section == 2 { return 0 }
        return 43
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear
        return footerView
    }
}
