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
   
    //////////////////////////
    //       初期の設定       //
    //////////////////////////
    var name = 1
    var FileMax = 4
    var StartStop_flg:Int = 0

    //TIMER インスタンス
    var TIMER_AUTO_CHANGE_IMAGE:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //初期画面設定関数
        Set_Image(image_NO: name)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let KakudaiView:KAKUDAI_ViewController=segue.destination as! KAKUDAI_ViewController
        KakudaiView.Kakudai_No = name
    }
    
    //////////////////////////
    //       Function       //
    //////////////////////////
    
    //画像表示関数
    func Set_Image(image_NO:Int){
        let ImageFile = String(image_NO)    //（数字→文字）変換
        let img = UIImage(named:ImageFile)  //イメージインスタンス化
        //Storyboardへの表示
        self.Window_Imageview.image = img   //画像表示
    }
    // selector: #selector(updatetimer) で指定された関数
    // timeInterval: 2.0, repeats: true で指定された通り、2秒毎に呼び出され続ける
    func updateTimer(timer: Timer) {
        name+=1
        if name==5{name=1}
        Set_Image(image_NO: name)
    }
    
    func StartTimer(){
        if self.TIMER_AUTO_CHANGE_IMAGE == nil {
            // タイマーの作成、始動
            self.TIMER_AUTO_CHANGE_IMAGE=Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    //////////////////////////
    //       IBAction       //
    //////////////////////////
    
    @IBAction func BackImage(_ sender: Any) {
        name-=1
        if name==0{name=4}
        Set_Image(image_NO: name)
    }
    
    @IBAction func PlayStop(_ sender: Any) {
        if StartStop_flg==0{
            StartStop_flg=1
            btn_PlayStop.setTitle("停止", for: UIControlState.normal)
            btn_next.isHidden=true
            btn_back.isHidden=true
            StartTimer()
        }else if StartStop_flg==1{
            
            // タイマーを破棄
            self.TIMER_AUTO_CHANGE_IMAGE.invalidate()
            self.TIMER_AUTO_CHANGE_IMAGE=nil
            
            StartStop_flg=0
            btn_PlayStop.setTitle("再生", for: UIControlState.normal)
            btn_next.isHidden=false
            btn_back.isHidden=false
        }
    }
    
    @IBAction func NextImage(_ sender: Any) {
        name+=1
        if name==5{name=1}
        Set_Image(image_NO: name)
    }

}

