//
//  MyDialog.swift
//  SwiftUIDemo01
//
//  Created by v_bihongwei on 2023/3/27.
//

import Foundation
import UIKit

class MyDialog: UIView, UIGestureRecognizerDelegate {
    
    let tap = UITapGestureRecognizer()
    let contentView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
        tap.addTarget(self, action: #selector(dismiss))
        tap.delegate = self
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tap)
        showContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func showContentView() {
        contentView.frame = CGRect(x: 50, y: 100, width: 200, height: 300)
        contentView.backgroundColor = UIColor.green
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        self.addSubview(contentView)
    }
    
    
    @objc func dismiss() {
        self.removeFromSuperview()
    }
    
    // 判断点击子view不关闭弹出窗口
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view == self) {
            return true
        } else {
            return false
        }
    }
}
