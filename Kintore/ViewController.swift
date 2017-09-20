//
//  ViewController.swift
//  Kintore
//
//  Created by superkinoko on 2017/09/20 11:30
//  Copyright © 2017年 kinokodata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var menu = [SingleMotion]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        menu.append(SingleMotion(name: "ゆっくりお尻を下げます", time: 5))
        menu.append(SingleMotion(name: "キープ", time: 3))
        menu.append(SingleMotion(name: "ゆっくり戻ります", time: 5))
        menu.append(SingleMotion(name: "吸って", time: 2))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "goMain", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! MainView
        viewController.menu = self.menu
    }

}

class SingleMotion {
    
    let name: String
    let time: Int
    
    init(name: String, time: Int) {
        self.name = name
        self.time = time
    }

}

