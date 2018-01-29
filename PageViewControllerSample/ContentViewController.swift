//
//  ContentViewController.swift
//  PageViewControllerSample
//
//  Created by YoshinobuHARA on 2018/01/29.
//  Copyright © 2018年 JCOmeme. All rights reserved.
//

import UIKit

class ContentViewController: UIPageViewController {

    var page:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //ラベルを配置してページ番号を表示してるだけ
        let label = UILabel()
        label.text = String(page)
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 42)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
