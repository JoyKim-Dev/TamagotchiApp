//
//  standbyTableViewCell.swift
//  TamagotchiApp
//
//  Created by Joy Kim on 6/9/24.
//

import UIKit

class StandbyTableViewCell: UITableViewCell {

    let firstTGBtn = UIButton()
    let firstTGLable = UILabel()
    
    let secondTGBtn = UIButton()
    let secondTGLable = UILabel()
    
    let thirdTGBtn = UIButton()
    let thirdTGLable = UILabel()
    
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

extension StandbyTableViewCell {
    
    func configureHierarchy() {
        contentView.addSubview(tamagoBtnStack)
        contentView.addSubview(tamagoLableStack)
        
        let tamagoBtnItem = [firstTGBtn,secondTGBtn,thirdTGBtn]
        let tamagoLableItem = [firstTGLable,secondTGLable,thirdTGLable]
        for i in tamagoBtnItem {
            tamagoBtnStack.addArrangedSubview(i)
        }
        
        for i in tamagoLableItem {
            tamagoLableStack.addArrangedSubview(i)
        }

    }
    
    func configureLayout() {
        
        firstTGBtn.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        
        secondTGBtn.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        
        thirdTGBtn.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        
        firstTGLable.snp.makeConstraints { make in
            make.width.equalTo(firstTGBtn.snp.width)
        }
        
        secondTGLable.snp.makeConstraints { make in
            make.width.equalTo(secondTGBtn.snp.width)
        }
        
        thirdTGLable.snp.makeConstraints { make in
            make.width.equalTo(thirdTGBtn.snp.width)
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
        
        firstTGBtn.setImage(.no, for: .normal)
        firstTGBtn.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        firstTGBtn.layer.cornerRadius = firstTGBtn.frame.width/2
        firstTGBtn.clipsToBounds = true
       
        
        firstTGLable.text = "준비중이에요"
        firstTGLable.textAlignment = .center
        firstTGLable.font = .systemFont(ofSize: 13, weight: .semibold)
        firstTGLable.textColor = .gray
        firstTGLable.layer.borderColor = UIColor.gray.cgColor
        firstTGLable.layer.borderWidth = 1
        
        
        secondTGBtn.setImage(.no, for: .normal)
        secondTGBtn.layer.cornerRadius = firstTGBtn.frame.width/2
        secondTGBtn.clipsToBounds = true
      
        
        secondTGLable.text = "준비중이에요"
        secondTGLable.textAlignment = .center
        secondTGLable.font = .systemFont(ofSize: 13, weight: .semibold)
        secondTGLable.textColor = .gray
        secondTGLable.layer.borderColor = UIColor.gray.cgColor
        secondTGLable.layer.borderWidth = 1
        
        thirdTGBtn.setImage(.no, for: .normal)
        thirdTGBtn.layer.cornerRadius = firstTGBtn.frame.width/2
        thirdTGBtn.clipsToBounds = true
       
        
        thirdTGLable.text = "준비중이에요"
        thirdTGLable.textAlignment = .center
        thirdTGLable.font = .systemFont(ofSize: 13, weight: .semibold)
        thirdTGLable.textColor = .gray
        thirdTGLable.layer.borderColor = UIColor.gray.cgColor
        thirdTGLable.layer.borderWidth = 1
        
    }
    @objc func tapped() {
        print("버튼눌림")
    }
}
