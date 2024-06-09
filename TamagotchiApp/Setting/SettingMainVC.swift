//
//  SettingMainVC.swift
//  TamagotchiApp
//
//  Created by Joy Kim on 6/7/24.
//

import UIKit

class SettingMainVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
       
    }
    

   

}

extension SettingMainVC {
    
    func configureUI() {
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.navigationItem.title = "설정"
        
    }
}
