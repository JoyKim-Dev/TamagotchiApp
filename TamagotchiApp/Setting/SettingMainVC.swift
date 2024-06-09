//
//  SettingMainVC.swift
//  TamagotchiApp
//
//  Created by Joy Kim on 6/7/24.
//

import UIKit
import SnapKit

class SettingMainVC: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
       
    }
    

   

}

extension SettingMainVC {
    
    func configureHierarchy() {
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func configureUI() {
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.navigationItem.title = "설정"
        
        let backBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backBtnTapped))
        navigationItem.leftBarButtonItem = backBtn
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.rowHeight = 60
        
    }
    
    @objc func backBtnTapped() {
        dismiss(animated: true)
    }
    
    @objc func nameEditNextBtnTapped() {
       
        let vc = NameEditVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    @objc func tamagoChangeNextBtnTapped() {
        let vc = SelectionVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .automatic
        present(nav, animated: true)
    }
    
    @objc func dataResetNextBtnTapped() {
        print("초기화 진행")
        
        let alert = UIAlertController(title: "초기화 진행합니까?", message: "돌이킬 수 없는 작업입니다!.", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
            self.reset()
         
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in
            self.backBtnTapped()
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true)
        
    }
    
    func reset(){
//        UserDefaults.standard.removeObject(forKey: UserDefaultManager.nickname)
        UserDefaultManager.nickname = ""
        dismiss(animated: true)
        // rootview로 어떻게 돌아오지..!
  
        print("초기화완료")
    }
}

extension SettingMainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        
        let i = indexPath.row
        
        if i == 0 {
            cell.nextBtn.addTarget(self, action: #selector(nameEditNextBtnTapped), for: .touchUpInside)
        } else if i == 1 {
            cell.nextBtn.addTarget(self, action: #selector(tamagoChangeNextBtnTapped), for: .touchUpInside)
        } else {
            cell.nextBtn.addTarget(self, action: #selector(dataResetNextBtnTapped), for: .touchUpInside)
        }
 
        cell.configUI(indexPath: indexPath)
        
        return cell
    }
    
    
    
}
