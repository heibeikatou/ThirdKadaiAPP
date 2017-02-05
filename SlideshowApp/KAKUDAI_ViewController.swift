//
//  KAKUDAI_ViewController.swift
//  SlideshowApp
//
//  Created by HEIBEI KATO on 2017/02/05.
//  Copyright © 2017年 DT.Products. All rights reserved.
//

import UIKit

class KAKUDAI_ViewController: UIViewController, UIScrollViewDelegate  {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btn_Back: UIButton!
    
    var Kakudai_No:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // スクロールビューの設定
        scrollView.delegate=self
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = 8
        self.scrollView.isScrollEnabled = true
        self.scrollView.showsHorizontalScrollIndicator = true
        self.scrollView.showsVerticalScrollIndicator = true
        
        
        let ImageFile2 = String(Kakudai_No)    //（数字→文字）変換
        let img2 = UIImage(named:ImageFile2)  //イメージインスタンス化
        //Storyboardへの表示
        self.imageView.image = img2   //画像表示
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //ピンチイン・ピンチアウト
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //print("pinch")
        return self.imageView
    }

}
