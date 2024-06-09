//
//  CustomAlertController.swift
//  TamagotchiApp
//
//  Created by Joy Kim on 6/9/24.
//

import UIKit
import SnapKit

class CustomAlertController: UIViewController {
    
    var data: String?
    
    private let containerView = UIView()
    private let imageView = UIImageView()
    private let imageLabel = UILabel()
    private let lineView = UIView()
    private let messageLabel = UILabel()
    private let startBtn = UIButton()
    private let cancelBtn = UIButton()
    
    lazy var btnStack = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configHierarchy()
        configLayout()
        configUI()
    }

}

extension CustomAlertController {
    
    func configHierarchy() {
        view.addSubview(containerView)
        view.addSubview(imageView)
        view.addSubview(imageLabel)
        view.addSubview(lineView)
        view.addSubview(messageLabel)
        view.addSubview(btnStack)
        
        btnStack.addArrangedSubview(cancelBtn)
        btnStack.addArrangedSubview(startBtn)
        
    }
    
    func configLayout() {
        
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(450)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(containerView).inset(50)
            make.centerX.equalTo(containerView)
            make.height.width.equalTo(130)
            }
    
        imageLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.centerX.equalTo(containerView)
            make.width.equalTo(100)
            make.height.equalTo(15)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.width.equalTo(250)
            make.top.equalTo(imageLabel.snp.bottom).offset(20)
            make.centerX.equalTo(containerView)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(containerView).inset(20)
            make.centerX.equalTo(containerView)
            make.bottom.greaterThanOrEqualTo(btnStack.snp.top).offset(-10)
        }
        
        btnStack.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(containerView)
            make.height.equalTo(60)
        }
        
    }
    
    func configUI() {
        
        view.backgroundColor = .clear
        containerView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        containerView.layer.cornerRadius = 4
        

       
        imageView.contentMode = .scaleAspectFit
        
        if data == "따끔따끔 다마고치" {
            imageView.image = UIImage._1_6
        } else if data == "방실방실 다마고치" {
            imageView.image = UIImage._2_6
        } else {
            imageView.image = UIImage._3_6
        }
   
        imageLabel.text = " 따끔따끔 다마고치 "
        imageLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        imageLabel.textColor = .gray
        imageLabel.layer.borderColor = UIColor.gray.cgColor
        imageLabel.layer.borderWidth = 1
        
        if data == "따끔따끔 다마고치" {
            imageLabel.text = " 따끔따끔 다마고치 "
        } else if data == "방실방실 다마고치" {
            imageLabel.text = " 방실방실 다마고치 "
        } else {
            imageLabel.text = " 반짝반짝 다마고치 "
        }
        
        
        lineView.backgroundColor = .lightGray
        
   
        messageLabel.text = "프레임워크와 라이브러리의 핵심적인 차이는 바로 이것 입니다. 프레임워크의 코드에는 완성된 기능들이 포함되지 않는다는 것입니다.다른 말로해서 프레임워크는 애플리케이션의 설계도를 제공하는 프로그램의 골격들이지 완성된 제품은 아니라는 것입니다. "
        messageLabel.lineBreakMode = .byWordWrapping
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        messageLabel.textColor = .gray

        startBtn.setTitle("시작하기", for: .normal)
        startBtn.setTitleColor(.gray, for: .normal)
        startBtn.layer.borderWidth = 0.5
        startBtn.layer.borderColor = .init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        startBtn.addTarget(self, action: #selector(startAlert), for: .touchUpInside)
  
        cancelBtn.setTitle("취소", for: .normal)
        cancelBtn.setTitleColor(.gray, for: .normal)
        cancelBtn.layer.borderWidth = 0.5
        cancelBtn.layer.borderColor = .init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        cancelBtn.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
        
        btnStack.axis = .horizontal
        btnStack.spacing = 0
        btnStack.distribution = .fillEqually

        
    }
    
    @objc func dismissAlert() {
        
        cancelBtn.backgroundColor = .lightGray.withAlphaComponent(0.2)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func startAlert() {
        print("눌림")
        startBtn.backgroundColor = .lightGray.withAlphaComponent(0.2)
        let vc = MyTamagotchiVC()
        vc.data = data
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
        // 메인 화면이 결정됨.
    }
}
