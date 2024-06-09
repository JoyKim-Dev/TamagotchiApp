//
//  ReusableProtocol.swift
//  TamagotchiApp
//
//  Created by Joy Kim on 6/9/24.
//

import UIKit

// 이 프로토콜을 채택하면 무조건 아래 연산프로퍼티는 갖고 있도록 최소조건 설정. static으로 생성하여 타입 프로퍼티라 인스턴스 생성 없이 호출해서 사용 가능토록 함.
// class / struct / enum 어디든 채택하여 사용 가능 -> but, 클래스에서만 채택할 수 있도록 강제로 클래스 제약 걸어서 한정할 수 있음.

// AnyObject: 클래스 제약 (옛날에는 class라는 키워드였는데 deprecated됨)
protocol ReusableProtocol: AnyObject {
    static var identifier: String { get }

}

// UITableViewCell에서 위 프로토콜 무조건 채택하도록 확장 규칙 생성
extension UITableViewCell: ReusableProtocol {

    // set 말고 get밖에 없어서 키워드 get 생략.
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController:ReusableProtocol {
    
    static var identifier: String {
        return String(describing: self)
    }
}
