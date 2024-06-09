//
//  UserDefaultsManager.swift
//  TamagotchiApp
//
//  Created by Joy Kim on 6/9/24.
//

import UIKit



    
    class UserDefaultManager {
        // String? 타입말고 그냥 String으로 해서 내부에서 아예 옵셔널 벗긴 값을 구해서 전달
      static var nickname: String {
            
            get {
                return UserDefaults.standard.string(forKey: "nickname") ?? "아무개"
            }
            // set 에서 newValue라는 매개변수는 자동 제공됨. 외부에서 받아오는 값을 newValue라고 인식해줌.
            set {
                UserDefaults.standard.set(newValue, forKey: "nickname")
            }
        }
        
        
        
    }

    

