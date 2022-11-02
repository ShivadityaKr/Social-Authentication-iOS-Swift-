//
//  AppButton.swift
//  SocialAuthentication
//
//  Created by Shivaditya Kumar on 2022-11-02.
//

import UIKit

class AppButton: UIButton {
    var iconImageView: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.titleLabel?.numberOfLines = 0
        self.titleLabel?.font = .systemFont(ofSize: 18)
        self.setTitleColor(.black, for: .normal)
        iconImageView = UIImageView(frame: CGRect(x: 25, y: 14, width: 25, height: 25))
        iconImageView?.contentMode = .center
        self.addSubview(iconImageView!)
        self.layer.removeAllAnimations()
    }
    func setIcon(iconType: IconType) {
        var image = UIImage(named: "Facebook")
        switch iconType {
        case .facebook:
            image = UIImage(named: "Facebook")
        case .apple:
            image = UIImage(named: "Apple")
        case .google:
            image = UIImage(named: "Google")
        }
        self.iconImageView?.image = image
    }
}

enum IconType {
    case facebook
    case apple
    case google
}
