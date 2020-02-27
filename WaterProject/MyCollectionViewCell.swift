//
//  MyCollectionViewCell.swift
//  TextChanger
//
//  Created by Pedro Pablo Pérez López on 06/12/2019.
//  Copyright © 2019 Pedro Pablo Pérez López. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell  {
    @IBOutlet weak var mVistaPrueba: UIView!
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                print("yes")
                mVistaPrueba.backgroundColor = UIColor.secondarySystemBackground
                // Your customized animation or add a overlay view
            } else {
                print("no")
                mVistaPrueba.backgroundColor = UIColor.clear
                // Your customized animation or remove overlay view
            }
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                print("yes")
                mVistaPrueba.backgroundColor = UIColor.secondarySystemBackground
                // Your customized animation or add a overlay view
            } else {
                print("no")
                mVistaPrueba.backgroundColor = UIColor.clear
                // Your customized animation or remove overlay view
            }
        }
    }
    /*
    // MARK: - Navigation

     
     required init?(coder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
     }
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
