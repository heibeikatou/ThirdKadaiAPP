//
//  ViewController.swift
//  SlideshowApp
//
//  Created by HEIBEI KATO on 2017/01/30.
//  Copyright © 2017年 DT.Products. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Window_Imageview: UIImageView!
    
    @IBOutlet weak var btn_back: UIButton!
    @IBOutlet weak var btn_PlayStop: UIButton!
    @IBOutlet weak var btn_next: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //初期画面設定関数
        init_ImageView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func init_ImageView() {
        //インスタンスの作成
        let img = UIImage(named:"1")
        //Storyboardへの表示
        self.Window_Imageview.image = img
    
    }
    
    @IBAction func BackImage(_ sender: Any) {
    }
    @IBAction func PlayStop(_ sender: Any) {
    }
    @IBAction func NextImage(_ sender: Any) {
    }


}

