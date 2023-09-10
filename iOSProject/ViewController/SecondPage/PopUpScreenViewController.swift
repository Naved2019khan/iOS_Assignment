//
//  PopUpScreenViewController.swift
//  iOSProject
//
//  Created by Naved  on 05/09/23.
//

import UIKit

class PopUpScreenViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var popCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        popCollectionView.delegate = self
        popCollectionView.dataSource = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.02){ [self] in
            nextButton.layer.cornerRadius = nextButton.frame.size.height / 2
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
   
    }
    
    
    @IBAction func nextButton(_ sender: UIButton) {
     
        if let currentIndexPath = popCollectionView.indexPathsForVisibleItems.first
        {
            if currentIndexPath.row < 2{
                if currentIndexPath.row == 1{
                    sender.setTitle("Comfirm", for: .normal)
                    sender.backgroundColor = .black
                    sender.tintColor  = .white
                }
                let nextRow = currentIndexPath.row + 1
                   let nextIndexPath = IndexPath(row: nextRow, section: currentIndexPath.section)
                   popCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            }
        
        }
        }
}


extension PopUpScreenViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0 :
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOneCollectionViewCell", for: indexPath) as! CellOneCollectionViewCell
                return cell
        case 1 :
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellTwoCollectionViewCell", for: indexPath) as! CellTwoCollectionViewCell
                return cell
        default :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellThreeCollectionViewCell", for: indexPath) as! CellThreeCollectionViewCell
            return cell
            
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionFrame = collectionView.frame
        return CGSize(width: collectionFrame.width , height:  collectionFrame.height)
    }
    
    
    
}
