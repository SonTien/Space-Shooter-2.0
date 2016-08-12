//
//  MeteorView.swift
//  SpaceShooter
//
//  Created by HoangHai on 6/25/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class MeteorView: UIImageView {
    var status : Int?
    var radian = CGFloat()
    var radius = CGFloat()
    var vx = 0
    var widthFrame : Int?
    var heightFrame : Int?
    var widthMete : Int?
    var heightMete : Int?
    let MOVE : Int = 0
    let OUT: Int = 2
    var imgT = 1
    var meteHP = 20{
        didSet{
            switch (meteHP) {
            case 5: self.image = UIImage(named: "mete4.png")
            case 4: changeImg("mete")
            case 3: if (imgT == 6) { changeImg("bmete") }
                else { changeImg("mete") }
            case 2: if (imgT < 5) { changeImg("mete") }
                else { changeImg("bmete") }
            case 1: if (imgT < 5){ changeImg("bmete") }
                else { changeImg("bbmete") }
            case 0: self.animationImages = [UIImage(named:"expl1.png")!,
                                            UIImage(named:"expl2.png")!,
                                            UIImage(named:"expl3.png")!,
                                            UIImage(named:"expl4.png")!,
                                            UIImage(named:"expl5.png")!,
                                            UIImage(named:"expl6.png")!,
                                            UIImage(named:"expl7.png")!,
                                            UIImage(named:"expl8.png")!,
                                            UIImage(named:"expl9.png")!]
                self.image = UIImage(named: "expl0.png")
                self.animationDuration = 0.5
                self.animationRepeatCount = 1
                self.startAnimating()

            default: break
            }
        }
    }

    override init(frame: CGRect)
    {
        self.widthMete = Int(frame.width)
        self.heightMete = Int(frame.height)
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    // if -> switch
    func generateMete(height:Int)
    {
        self.contentMode = .ScaleAspectFill
        self.heightFrame = height;
        self.vx = Int(arc4random_uniform(5)) - 1
        let x: Float = Float(arc4random_uniform(600) + 200)
        self.status = MOVE
        if (Int(self.center.y) <= Int(self.heightMete!/2))
        {
            self.transform = CGAffineTransformIdentity
            switch (imgT) {
            case 0,1,2,3,4: meteHP = 1
            case 5: meteHP = 3
            case 6: meteHP = 4
            case 7: meteHP = 5
            case 8: meteHP = 20
            case 9: meteHP = 5
            default:
                break
            }
            changeImg("mete")
            self.frame = CGRectMake(CGFloat(x), -CGFloat(self.heightMete!), CGFloat(self.widthMete!), CGFloat(self.heightMete!))
        }
    }

        // if -> switch
    func changeImg(imgName: String)
    {
        switch imgT {
        case 0,1,2,3,4: self.image = UIImage(named: "\(imgName)1.png")
        case 5        : self.image = UIImage(named: "\(imgName)2.png")
        case 6        : self.image = UIImage(named: "\(imgName)3.png")
        case 7        : self.image = UIImage(named: "\(imgName)4.png")
        case 8        : self.image = UIImage(named: "energy.png")
        case 9        : self.image = UIImage(named: "notNiceMete.png")
        default:
            break
        }
    }
    

    func updateMete()
    {
        if (self.status == MOVE)
        {
            self.center = CGPointMake(self.center.x, self.center.y + 5)
            if (Int(self.center.y) > self.heightFrame! || (Int(self.center.y) < -self.heightMete! ))
            {
                self.status = OUT
                self.removeFromSuperview()
            }
        }
        else if (meteHP == 0)
        {
            self.center = CGPointMake(self.center.x, self.center.y + 5)
            if (Int(self.center.y) > self.heightFrame! || (Int(self.center.y) < -self.heightMete! ))
            {
                self.status = OUT
                removeFromSuperview()
            }
        }
    }
}
