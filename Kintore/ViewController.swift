//
//  ViewController.swift
//  Kintore
//
//  Created by superkinoko on 2017/09/20 11:30
//  Copyright © 2017年 kinokodata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let menu = SingleMenu(name: "スクワット", numberOfRepeat: 20)

    @IBOutlet weak var numberOfSetTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = menu.name
        numberOfSetTextField.text = String(menu.numberOfRepeat)
        
        menu.motions.append(SingleMotion(name: "ゆっくりお尻を下げます", time: 5))
        menu.motions.append(SingleMotion(name: "キープ", time: 3))
        menu.motions.append(SingleMotion(name: "ゆっくり戻ります", time: 5))
        menu.motions.append(SingleMotion(name: "吸って", time: 2))
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.motions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aMotionCell", for: indexPath) as! AMotionCell
        
        cell.nameLabel.text = menu.motions[indexPath.row].name
        cell.timeLabel.text = String(menu.motions[indexPath.row].time)
        print(menu.motions[indexPath.row].time)
        
        return cell
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

class SingleMenu {
    let name: String
    let numberOfRepeat: Int
    var motions = [SingleMotion]()
    
    init(name: String, numberOfRepeat: Int) {
        self.name = name
        self.numberOfRepeat = numberOfRepeat
    }
}

