//
//  SecondPageViewController.swift
//  iOSProject
//
//  Created by Naved  on 05/09/23.
//

import UIKit

class SecondPageViewController: UIViewController {
    
    @IBOutlet weak var upperSmallView: UIView!
    @IBOutlet weak var candyLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var viewWithButtons: UIStackView!
    @IBOutlet weak var lowerLargeButton: UIButton!
    @IBOutlet weak var lowerSmallButton: UIButton!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var CandyCollectionView: UICollectionView!
    var buttonRadius = CGFloat()
    var isPlay = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.progressBar.frame.size.width = 50
        initialSetup()
        DispatchQueue.main.async {
            [self] in
            viewAppearSetup()
        }
    }

    // MARK: Button Action
    @IBAction func lowerLargerButton(_ sender: Any) {
        
    }
    @IBAction func lowerSmallButton(_ sender: Any) {
    }
    @IBAction func topButton(_ sender: Any) {
        if isPlay{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopUpScreenViewController") as! PopUpScreenViewController
            navigationController?.present(vc, animated: true)
        }
        else{
            isShowingBottom(flag: true)
            progressBar.isHidden = false
            progressBar.frame.size.width = 50
            lowerLargeButton.setTitle("", for: .normal)
            UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveLinear, animations: {
                self.progressBar.frame.size.width = self.lowerLargeButton.frame.width
            }, completion: { _ in
                self.lowerSmallButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
                self.lowerLargeButton.setTitle("Download", for: .normal)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                    self.progressBar.isHidden = true
                    self.isShowingBottom(flag: false)
                    self.topButton.setTitle("Play", for: .normal)
                    self.topButton.backgroundColor = .systemBlue
                    self.isPlay = true
                }
                
            })
        }
        
        
        
    }
}

extension SecondPageViewController{
    //MARK: InitialSetup
    func initialSetup(){
        
        CandyCollectionView.delegate = self
        CandyCollectionView.dataSource = self
        candyLabel.text = "CAND \n BUST"
        cornerRadius(viewInput: upperSmallView, radius: 12)
        topButton.setTitle("Download 30 MB", for: .normal)
        isShowingBottom(flag: false)
        
    }
    //MARK: viewAppearSetup
    func viewAppearSetup(){
        buttonRadius = lowerLargeButton.frame.height / 2
        cornerRadius(viewInput: lowerLargeButton, radius: buttonRadius)
        cornerRadius(viewInput: topButton, radius: buttonRadius)
        cornerRadius(viewInput: progressBar, radius: buttonRadius)
        
        
    }
    
    //MARK: Helper Functions
    /** corner  radius*/
    func cornerRadius(viewInput : UIView,radius : CGFloat)
    {
        viewInput.layer.cornerRadius = radius
    }
    
    func isShowingBottom(flag : Bool)
    {
        if flag{
            topButton.isHidden = true
            viewWithButtons.isHidden = false
            //            progressBar.isHidden = false
        }
        else{
            
            topButton.isHidden = false
            viewWithButtons.isHidden = true
            progressBar.isHidden = true
            
        }
        
    }
    
}

extension SecondPageViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CandyCell", for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionFrame = collectionView.frame
        return CGSize(width: collectionFrame.width / 2 - 5 , height:  collectionFrame.height)
    }
    
    
    
}


