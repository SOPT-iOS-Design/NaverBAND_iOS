//
//  HomeViewController.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/24.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tab bar item의 title 설정
        if let downcastStrings = self.tabBarController?.tabBar.items
        {
            downcastStrings[0].title = "Home"
            downcastStrings[1].title = "New"
            downcastStrings[2].title = "Search"
            downcastStrings[3].title = "Chat"
            downcastStrings[4].title = "MyPage"
        }
        // tab bar item image 설정
            self.tabBarController?.tabBar.items![0].image = UIImage(named: "icTabHome")
            self.tabBarController?.tabBar.items![1].image = UIImage(named: "icTabNew")
            self.tabBarController?.tabBar.items![2].image = UIImage(named: "icTabSearch")
            self.tabBarController?.tabBar.items![3].image = UIImage(named: "icTabChat")
            self.tabBarController?.tabBar.items![4].image = UIImage(named: "icTabMypage")
            
            // 클릭시 tab bar color 설정
            self.tabBarController?.tabBar.selectedImageTintColor = UIColor.naver

           
        }

       
    }
    
    
