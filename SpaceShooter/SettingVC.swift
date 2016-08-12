//
//  SettingVC.swift
//  SpaceShooter
//
//  Created by Hùng Nguyễn  on 8/2/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func SoundSwitch(sender: UISwitch) {
        if sender == true {
           print("Turn off ship sound")
        } else {
           print("Turn on ship sound")
        }
    }
    
    @IBAction func MusicSwitch(sender: UISwitch) {
        if sender == true {
            print("Turn off game music")
        } else {
            print("Turn on game music")
        }
    }
    
    @IBAction func NotificationSwitch(sender: UISwitch) {
        if sender == true {
            print("Turn off game notiffication")
        } else {
            print("Turn on game notification")
        }

    }

    @IBAction func HintSwitch(sender: UISwitch) {
        if sender == true {
            print("Turn off hints")
        } else {
            print("Turn on hints")
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
