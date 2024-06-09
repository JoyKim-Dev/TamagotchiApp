//
//  TamagotchiSelectionViewController.swift
//  TamagotchiApp
//
//  Created by Joy Kim on 6/7/24.
//

import UIKit
import SnapKit

class SelectionVC: UIViewController {
    
    let tamagoTableView = UITableView()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
       
    }

}

extension SelectionVC {
    
    func configureHierarchy(){
        view.addSubview(tamagoTableView)
    }
    func configureLayout(){
        tamagoTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func configureUI(){
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        self.navigationItem.title = "다마고치 선택하기"
        
        tamagoTableView.delegate = self
        tamagoTableView.dataSource = self
        tamagoTableView.rowHeight = 150
        tamagoTableView.register(TamagoTableViewCell.self, forCellReuseIdentifier: TamagoTableViewCell.identifier)
        tamagoTableView.register(StandbyTableViewCell.self, forCellReuseIdentifier: StandbyTableViewCell.identifier)
        
    }
    
    @objc func heartBtntapped() {
      let customAlert = CustomAlertController()
        customAlert.data = "따끔따끔 다마고치"
        present(customAlert, animated: true)
    print("따끔눌림")
    }
    
    @objc func cloudBtntapped() {
      let customAlert = CustomAlertController()
        customAlert.data = "방실방실 다마고치"
        present(customAlert, animated: true)
    print("방실눌림")
    }
    
    @objc func starBtntapped() {
      let customAlert = CustomAlertController()
        customAlert.data = "반짝반짝 다마고치"
        present(customAlert, animated: true)
    print("반짝눌림")
    }
    
}

extension SelectionVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tamagoTableView.dequeueReusableCell(withIdentifier: TamagoTableViewCell.identifier) as! TamagoTableViewCell
            cell.heartTGBtn.addTarget(self, action: #selector(heartBtntapped), for: .touchUpInside)
            cell.cloudTGBtn.addTarget(self, action: #selector(cloudBtntapped), for: .touchUpInside)
            cell.starTGBtn.addTarget(self, action: #selector(starBtntapped), for: .touchUpInside)
            
            return cell
        } else {
            let cell = tamagoTableView.dequeueReusableCell(withIdentifier: StandbyTableViewCell.identifier) as! StandbyTableViewCell
            return cell
        }
        
    }
    
    
    
    
    
    
}

