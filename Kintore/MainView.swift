//
//  MainView.swift
//  Kintore
//
//  Created by superkinoko on 2017/09/20.
//  Copyright © 2017年 kinokodata. All rights reserved.
//

import UIKit

class MainView: UIViewController {
    var menu: [SingleMotion]!
    var timer: Timer?
    var count: Int = 0
    var nowIndex: Int = 0
    var repeatCount: Int = 0
    var repeatValue: Int = 20

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var setLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(self.timerInterrupt(_:)),
                                     userInfo: nil,
                                     repeats: true)

        // Do any additional setup after loading the view.
//        menu.forEach {
//            print($0.name)
//            print($0.time)
//            if let nowTimer = timer {
//                if nowTimer.isValid {
//                    return
//                }
//            }
//        }
    }
    
    func timerInterrupt(_ timer: Timer) {
        count += 1
        if displayUpdate() <= 0 {
            count = 0
            nowIndex += 1
            if nowIndex >= menu.count {
                repeatCount += 1
                nowIndex = 0
                if repeatCount >= repeatValue {
                    timer.invalidate()
                }
            }
        }
    }
    
    func displayUpdate() -> Int {
//        print(nowIndex)
//        print(menu[nowIndex].name)
        self.nameLabel.text = menu[nowIndex].name
        let time = menu[nowIndex].time
//        print(count)
        self.timeLabel.text = String(count)
        self.setLabel.text = String(repeatCount)
        return time - count
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
