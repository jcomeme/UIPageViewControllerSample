//
//  ViewController.swift
//  PageViewControllerSample
//
//  Created by YoshinobuHARA on 2018/01/29.
//  Copyright © 2018年 JCOmeme. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    //コンテンツを表示するviewControllerの配列
    var contentArray = [ContentViewController]()
    
    //ページ番号
    var pageIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //０−９までの数字ラベルがついたviewControllerを作って配列に格納するだけ
        for i in 0...9{
            let contentViewController = ContentViewController()
            contentViewController.page = i
            self.contentArray.append(contentViewController)
        }

        //UIPageViewControllerを初期化
        let pageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        //dataSourceとdelegateを設定
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        //pageViewControllerを子に追加
        self.addChildViewController(pageViewController)
        
        //最初に表示するviewControllerを指定
        pageViewController.setViewControllers([contentArray[0]], direction: .forward , animated: false, completion: nil)
        
        //pageViewControllerのviewを自身のviewに追加
        self.view.addSubview(pageViewController.view)
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //ページが戻った時に表示するviewControllerを返す。これ以上戻れないときはnilを返す
        if self.pageIndex > 0 {
            return contentArray[self.pageIndex - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //ページが進んだ時に表示するviewControllerを返す。これ以上進めないときはnilを返す
        if self.pageIndex < (contentArray.count - 1) {
            return contentArray[self.pageIndex + 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        //実際にページが遷移したらcompletedにtrueが入って呼び出されるので、インデックスを進めたり戻したりする。
        if completed {
            let contentViewController = pageViewController.viewControllers![0] as! ContentViewController
            self.pageIndex = contentViewController.page
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

