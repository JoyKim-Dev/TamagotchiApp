//
//  MyTamagotchiVC.swift
//  TamagotchiApp
//
//  Created by Joy Kim on 6/7/24.
//

import UIKit
import SnapKit

class MyTamagotchiVC: UIViewController {

var data: String?
    
    let mainImage = UIImageView()
    let messageLabel = UILabel()
    let messageImage = UIImageView()
    let tamagoLabel = UILabel()
    let statusLabel = UILabel()
    let foodTF = UITextField()
    let waterTF = UITextField()
    let foodBtn = UIButton()
    let waterBtn = UIButton()
    
    lazy var foodStack = UIStackView()
    lazy var waterStack = UIStackView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configHierarchy()
        configLayout()
        configUI()
       
    }

}

extension MyTamagotchiVC {
    
    func configHierarchy() {
        view.addSubview(mainImage)
        view.addSubview(messageLabel)
        view.addSubview(messageImage)
        view.addSubview(tamagoLabel)
        view.addSubview(statusLabel)
        view.addSubview(foodStack)
        view.addSubview(waterStack)
        
        foodStack.addArrangedSubview(foodTF)
        foodStack.addArrangedSubview(foodBtn)
        
        waterStack.addArrangedSubview(waterTF)
        waterStack.addArrangedSubview(waterBtn)
    }
    
    func configLayout() {
        
        messageImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(messageImage).inset(15)
            make.horizontalEdges.equalTo(messageImage).inset(10)
        }
        
        mainImage.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(messageImage.snp.bottom).offset(10)
            make.height.width.equalTo(200)
        }
        
        tamagoLabel.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(10)
            make.centerX.equalTo(view)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(tamagoLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view)
        }
        
        foodStack.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
        
        waterStack.snp.makeConstraints { make in
            make.top.equalTo(foodStack.snp.bottom).offset(10)
            make.centerX.equalTo(view)
        }
        
    }
    
    func configUI() {
        self.navigationItem.title = "네임님의 다마고치"
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        let settingIcon = UIBarButtonItem(image: UIImage(systemName: "person.fill"), style: .plain, target: self, action: #selector(settingIconTapped))
        navigationItem.rightBarButtonItem = settingIcon
        
        messageImage.image = .bubble
        
        messageLabel.text = "잘 키워주세요"
        messageLabel.numberOfLines = 0
        messageLabel.font = .boldSystemFont(ofSize: 15)
        messageLabel.textAlignment = .center
        
        mainImage.contentMode = .scaleAspectFit

        if data == "따끔따끔 다마고치" {
            mainImage.image = UIImage._1_1
        } else if data == "방실방실 다마고치" {
            mainImage.image = UIImage._2_1
        } else {
            mainImage.image = UIImage._3_1
        }
        
        tamagoLabel.text = data
        tamagoLabel.backgroundColor = .blue.withAlphaComponent(0.05)
        tamagoLabel.font = .boldSystemFont(ofSize: 15)
        tamagoLabel.textColor = .gray
        tamagoLabel.layer.borderColor = UIColor.gray.cgColor
        tamagoLabel.layer.borderWidth = 1
        
        statusLabel.text = "LV1.밥알 0개.물방울 0개"
        statusLabel.textColor = .gray
        statusLabel.font = .boldSystemFont(ofSize: 12)
        statusLabel.textAlignment = .center
        
        foodTF.placeholder = "밥주세용"
//        let border = CALayer()
//        border.frame = CGRect(x: 0, y: foodTF.frame.size.height-1, width: foodTF.frame.width, height: 1)
//        border.borderWidth = 1
//        border.backgroundColor = UIColor.red.cgColor
//       foodTF.layer.addSublayer(border)
        
        foodBtn.setImage(.checkmark, for: .normal)
        foodBtn.setTitle("밥먹기", for: .normal)
        foodBtn.setTitleColor(.black, for: .normal)
        foodBtn.layer.borderWidth = 2
        foodBtn.layer.borderColor = UIColor.blue.cgColor
        
        foodStack.axis = .horizontal
        foodStack.spacing = 10
        foodStack.distribution = .fill
        
        waterTF.placeholder = "물주세용"
        
        waterBtn.setTitle("물먹기", for: .normal)
        waterBtn.setImage(.checkmark, for: .normal)
        waterBtn.setTitleColor(.black, for: .normal)
        waterBtn.layer.borderWidth = 2
        waterBtn.layer.borderColor = UIColor.blue.cgColor
        
        waterStack.axis = .horizontal
        waterStack.spacing = 10
        waterStack.distribution = .fill
        
        
        
    }
    
    @objc func settingIconTapped() {
        print("세팅아이콘눌림")
        let vc = SettingMainVC()
        
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
       
        
    }
}
