//
//  TamagoTableViewCell.swift
//  TamagotchiApp
//
//  Created by Joy Kim on 6/9/24.
//

import UIKit

class TamagoTableViewCell: UITableViewCell {

    let heartTGBtn = UIButton()
    let heartTGLable = UILabel()
    
    let cloudTGBtn = UIButton()
    let cloudTGLable = UILabel()
    
    let starTGBtn = UIButton()
    let starTGLable = UILabel()
    
    lazy var tamagoBtnStack = UIStackView()
    lazy var tamagoLableStack = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TamagoTableViewCell {
    
    func configureHierarchy() {
        contentView.addSubview(tamagoBtnStack)
        contentView.addSubview(tamagoLableStack)
        
        let tamagoBtnItem = [heartTGBtn,cloudTGBtn,starTGBtn]
        let tamagoLableItem = [heartTGLable,cloudTGLable,starTGLable]
        for i in tamagoBtnItem {
            tamagoBtnStack.addArrangedSubview(i)
        }
        
        for i in tamagoLableItem {
            tamagoLableStack.addArrangedSubview(i)
        }

    }
    
    func configureLayout() {
        
        heartTGBtn.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        
        cloudTGBtn.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        
        starTGBtn.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        
        heartTGLable.snp.makeConstraints { make in
            make.width.equalTo(heartTGBtn.snp.width)
        }
        
        cloudTGLable.snp.makeConstraints { make in
            make.width.equalTo(cloudTGBtn.snp.width)
        }
        
        starTGLable.snp.makeConstraints { make in
            make.width.equalTo(starTGBtn.snp.width)
        }

        
        tamagoBtnStack.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(20)
            make.leading.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(15)
        }
        
        tamagoLableStack.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.safeAreaLayoutGuide).inset(5)
            make.leading.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(20)
        }
    }
    
    func configureUI() {
        contentView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        tamagoBtnStack.axis = .horizontal
        tamagoBtnStack.spacing = 20
        tamagoBtnStack.distribution = .equalSpacing
        
        tamagoLableStack.axis = .horizontal
        tamagoLableStack.spacing = 20
        tamagoLableStack.distribution = .equalSpacing
        
        heartTGBtn.setImage(._1_6, for: .normal)
//        heartTGBtn.addTarget(self, action: #selector(heartBtntapped), for: .touchUpInside)
        heartTGBtn.layer.cornerRadius = heartTGBtn.frame.width/2
        heartTGBtn.clipsToBounds = true
       
        
        heartTGLable.text = " 따끔따끔 다마고치 "
        heartTGLable.font = .systemFont(ofSize: 13, weight: .semibold)
        heartTGLable.textColor = .gray
        heartTGLable.layer.borderColor = UIColor.gray.cgColor
        heartTGLable.layer.borderWidth = 1
        
        
        cloudTGBtn.setImage(._2_6, for: .normal)
//        cloudTGBtn.addTarget(self, action: #selector(cloudBtntapped), for: .touchUpInside)
        cloudTGBtn.layer.cornerRadius = heartTGBtn.frame.width/2
        cloudTGBtn.clipsToBounds = true
      
        
        cloudTGLable.text = " 방실방실 다마고치 "
        cloudTGLable.font = .systemFont(ofSize: 13, weight: .semibold)
        cloudTGLable.textColor = .gray
        cloudTGLable.layer.borderColor = UIColor.gray.cgColor
        cloudTGLable.layer.borderWidth = 1
        
        starTGBtn.setImage(._3_6, for: .normal)
//        starTGBtn.addTarget(self, action: #selector(starBtntapped), for: .touchUpInside)
        starTGBtn.layer.cornerRadius = heartTGBtn.frame.width/2
        starTGBtn.clipsToBounds = true
       
        
        starTGLable.text = " 반짝반짝 다마고치 "
        starTGLable.font = .systemFont(ofSize: 13, weight: .semibold)
        starTGLable.textColor = .gray
        starTGLable.layer.borderColor = UIColor.gray.cgColor
        starTGLable.layer.borderWidth = 1
        
    }
    
}
