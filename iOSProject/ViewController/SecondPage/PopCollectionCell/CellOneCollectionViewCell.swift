//
//  CellOneCollectionViewCell.swift
//  iOSProject
//
//  Created by Naved  on 05/09/23.
//

import UIKit

class CellOneCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var otherRoundView: UIView!
    @IBOutlet weak var viewFive: UIView!
    @IBOutlet weak var viewFour: UIView!
    @IBOutlet weak var viewThree: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewOne: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       initialSetup()

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {  [self] in
            roundView.layer.cornerRadius = roundView.frame.size.height / 2
            otherRoundView.layer.cornerRadius = otherRoundView.frame.size.height / 2
        }
   
    }
    
    //MARK: InitialSetup
    func initialSetup(){
        
        cornerRadius(viewInput: viewOne, radius: 3)
        cornerRadius(viewInput: viewTwo, radius: 3)
        cornerRadius(viewInput: viewThree, radius: 3)
        cornerRadius(viewInput: viewFive, radius: 3)
        cornerRadius(viewInput: viewFour, radius: 3)
      
    }
    
    func cornerRadius(viewInput : UIView,radius : CGFloat)
    {
        viewInput.layer.cornerRadius = radius
    }
}
