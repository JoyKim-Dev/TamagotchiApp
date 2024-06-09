//
//  SettingTableViewCell.swift
//  TamagotchiApp
//
//  Created by Joy Kim on 6/9/24.
//

import UIKit
import SnapKit

class SettingTableViewCell: UITableViewCell {

    let leftImage = UIImageView()
    let titleLabel = UILabel()
    let nextBtn = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configHierarchy()
        configLayout()
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingTableViewCell {
    
    func configHierarchy() {
        contentView.addSubview(leftImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(nextBtn)
    }
    
    func configLayout() {
        leftImage.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.height.width.equalTo(30)
            make.leading.equalTo(contentView).inset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(leftImage.snp.trailing).offset(20)
            make.trailing.equalTo(nextBtn.snp.leading).offset(-50)
        }
        
        nextBtn.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.height.equalTo(50)
            make.trailing.equalTo(contentView).inset(20)
        }

    }
    
    func configUI(indexPath: IndexPath) {
        
        let i = indexPath.row
        
        if i == 0 {
            leftImage.image = UIImage(systemName: "pencil")
            nextBtn.setTitle("고래밥 ", for: .normal)
            nextBtn.setTitleColor(.gray, for: .normal)
            nextBtn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            nextBtn.semanticContentAttribute = .forceRightToLeft
            titleLabel.text = "내 이름 설정하기"
            
        } else if i == 1 {
            leftImage.image = UIImage(systemName: "moon.fill")
            nextBtn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            titleLabel.text = "다마고치 변경하기"
        } else {
            leftImage.image = UIImage(systemName: "arrow.circlepath")
            nextBtn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
            titleLabel.text = "데이터 초기화"
        }
        
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textAlignment = .left
        
 
        
    }
    
    
}
