//
//  LangingPageViewController.swift
//  iOSProject
//
//  Created by Naved  on 05/09/23.
//

import UIKit

class LangingPageViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var upperLargeCardView: UIView!
    @IBOutlet weak var innerCardView: UIView!
    @IBOutlet weak var innerButton: UIButton!
    @IBOutlet weak var lowerCardView: UIView!
    var buttonRadius = CGFloat()
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        addGestureToView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearSetup()
   
    }
    
    
    @IBAction func innerButton(_ sender: Any) {
    }
}


extension LangingPageViewController{
    //MARK: InitialSetup
    func initialSetup(){
        
        cornerRadius(viewInput: upperLargeCardView, radius: 30)
        cornerRadius(viewInput: innerCardView, radius: 12)
      
    }
    //MARK: viewWillAppearSetup
    func viewDidAppearSetup(){
        buttonRadius =  innerButton.frame.height / 2
        cornerRadius(viewInput: innerButton, radius: buttonRadius)
        cornersCertainPosition(inputView: lowerCardView, with: [.layerMaxXMinYCorner,.layerMinXMinYCorner], radius: 30)
        
    }
    
    //MARK: Helper Functions
    /** corner  radius*/
    func cornerRadius(viewInput : UIView,radius : CGFloat)
    {
        viewInput.layer.cornerRadius = radius
    }
    
    /**This function give particular postion round radius*/
    func cornersCertainPosition(inputView : UIView,with CACornerMask: CACornerMask, radius: CGFloat) {
        inputView.layer.cornerRadius = radius
        inputView.layer.maskedCorners = [CACornerMask]
        
    }
}

extension LangingPageViewController{
    func addGestureToView(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.delegate = self
        upperLargeCardView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondPageViewController") as! SecondPageViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
