//
//  ViewController.swift
//  pincode-viper
//
//  Created by SemjonG on 20/08/2022.
//  Copyright © 2022 Company. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
        
    var output: ViewOutput?
    var viewReadyBlock: (() -> Void)?
    
    private var pincodeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.text = "ПИН-код"
        
        return label
    }()
    
    private var pincodeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Получить ПИН-код", for: .normal)
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 15
        button.sendActions(for: .touchUpInside)
        button.addTarget(self, action: #selector(didPressGeneratePincodeAction), for: .touchUpInside)

        return button
    }()
   
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output?.didTriggerViewWillAppearEvent()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isViewLoaded, let viewReadyBlock = viewReadyBlock {
            viewReadyBlock()
            self.viewReadyBlock = nil
        }
        
        output?.didTriggerViewReadyEvent()
        setupViews()
        setupConstraints()
        view.backgroundColor = UIColor.lightGray
    }
    
    // MARK: - Public
    func setupViewReadyBlock(block: @escaping () -> Void) {
        viewReadyBlock = block;
    }
    
    @objc
    func didPressGeneratePincodeAction(sender: UIButton) {
        output?.didPressGeneratePincodeAction()
        self.animateView(sender) // UIButton animation
    }

    // MARK: - Private
    private func setupViews() {
        view.addSubview(pincodeLabel)
        view.addSubview(pincodeButton)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            pincodeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            pincodeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            pincodeButton.widthAnchor.constraint(equalToConstant: 340),
            pincodeButton.heightAnchor.constraint(equalToConstant: 60),
            pincodeButton.topAnchor.constraint(equalTo: pincodeLabel.topAnchor, constant: 300),
            pincodeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // UIButton animation
    private func animateView(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.5,
                       options: .curveEaseIn,
                       animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            
        }) { (_) in
            UIView.animate(withDuration: 0.15,
                           delay: 0,
                           usingSpringWithDamping: 0.4,
                           initialSpringVelocity: 2,
                           options: .curveEaseIn,
                           animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
}


// MARK: - View Input
extension ViewController: ViewInput {
    func showFormattedPincode(_ string: String) {
        pincodeLabel.text = string
    }
}


