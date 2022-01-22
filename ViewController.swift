//
//  ViewController.swift
//  POC
//
//  Created by Adriano Rodrigues Vieira on 21/01/22.
//

import UIKit

class ViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        
        view = View(frame: UIScreen.main.bounds)
        view.backgroundColor = .red
    }        
    
    required init?(coder: NSCoder) {
        fatalError("duh")
    }
    
    func enterBG() {
        guard let v = view as? View else { return }
        v.hideLabel.isHidden = false
    }
    
    func exitBG() {
        guard let v = view as? View else { return }
        v.hideLabel.isHidden = true
    }
}


class View: UIView {
    lazy var label = buildLabel("Texto no app ativo", false, .blue)
    lazy var hideLabel = buildLabel("Texto no app in bg", true, .gray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(hideLabel)
        
        NSLayoutConstraint.activate(
            [
                label.topAnchor.constraint(equalTo: topAnchor),
                label.bottomAnchor.constraint(equalTo: bottomAnchor),
                label.leadingAnchor.constraint(equalTo: leadingAnchor),
                label.trailingAnchor.constraint(equalTo: trailingAnchor),
                
                hideLabel.topAnchor.constraint(equalTo: topAnchor),
                hideLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
                hideLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
                hideLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildLabel(_ title: String, _ hide: Bool, _ bg: UIColor) -> UILabel {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = hide
        label.backgroundColor = bg
        label.text = title
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        
        return label
    }
}
