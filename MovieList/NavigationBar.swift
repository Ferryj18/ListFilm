//
//  NavigationBar.swift
//  News
//
//  Created by Ferry jati on 07/12/23.
//

import UIKit

protocol NavigationBarDelegate {
    func pressBack()
}

class NavigationBar: UIView {
  @IBOutlet weak var btnBack: UIButton!
  
  @IBOutlet weak var lblTitle: UILabel!
    
    var delegate: NavigationBarDelegate?
    static let shared = NavigationBar()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    //MARK: - function ToolbarView
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    private func setUpView(){
        guard let view = self.loadViewFromNib(nibName: "NavigationBar") else{ return }
        view.frame = self.bounds
        self.addSubview(view)
        self.btnBack.addTarget(self, action: #selector(btnBackTap), for: .touchUpInside)
    }
    
    func setTitle(_ text: String){
        lblTitle.text = text
    }
    
    @objc private func btnBackTap(){
        self.delegate?.pressBack()
    }
    
    

}
