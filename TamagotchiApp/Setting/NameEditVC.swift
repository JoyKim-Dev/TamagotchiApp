//
//  NameEditVC.swift
//  TamagotchiApp
//
//  Created by Joy Kim on 6/7/24.
//

import UIKit
import SnapKit

class NameEditVC: UIViewController {

    
    let nicknameTF = UITextField()
    let lineView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configUI()
    }

}

extension NameEditVC {
    
    func configUI() {
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.navigationItem.title = "대장님 이름 정하기"
        nicknameTF.placeholder = UserDefaultManager.nickname
        
        lineView.backgroundColor = .gray
        
        let backBtnTapped = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backBtnTapped))
        navigationItem.leftBarButtonItem = backBtnTapped
        let saveBtnTapped = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveBtnTapped))
        navigationItem.rightBarButtonItem = saveBtnTapped
        
        
        view.addSubview(nicknameTF)
        view.addSubview(lineView)
        
        nicknameTF.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        lineView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.height.equalTo(1)
            make.top.equalTo(nicknameTF.snp.bottom)
        }
        
    }
    
    @objc func backBtnTapped() {
        dismiss(animated: true)
    }
    
    @objc func saveBtnTapped() {
        UserDefaultManager.nickname = nicknameTF.text ?? UserDefaultManager.nickname
        print("저장됨")
        let vc = MyTamagotchiVC()
        vc.navigationItem.title = UserDefaultManager.nickname
        dismiss(animated: true)
    }
    
}
