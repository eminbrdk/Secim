//
//  CheckVC.swift
//  28Mayıs
//
//  Created by Muhammed Emin Bardakcı on 10.07.2023.
//

import Foundation

//
//  DenetimVC.swift
//  Selection
//
//  Created by Muhammed Emin Bardakcı on 16.05.2023.
//

import UIKit
import SafariServices

class CheckVC: UIViewController {

    let tutanakButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tutanak Sorgulama Sitesine Git", for: .normal)
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = Constant.appColor
        button.configuration?.baseForegroundColor = .white
        button.configuration?.cornerStyle = .medium
        return button
    }()
    
    let sandıkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sandık Takip Sistemi Sitesine Git", for: .normal)
        button.configuration = .filled()
        button.configuration?.baseBackgroundColor = Constant.appColor
        button.configuration?.baseForegroundColor = .white
        button.configuration?.cornerStyle = .medium
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureButtons()
    }
    
    private func configureView() {
        view.backgroundColor = Constant.backgroundColor
        title = "Sorgula"
    }
    
    private func configureButtons() {
        view.addSubview(tutanakButton)
        view.addSubview(sandıkButton)
        
        tutanakButton.addTarget(self, action: #selector(tutanakButtonPressed), for: .touchUpInside)
        sandıkButton.addTarget(self, action: #selector(sandıkButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            tutanakButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            tutanakButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tutanakButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tutanakButton.heightAnchor.constraint(equalToConstant: 50),
            
            sandıkButton.topAnchor.constraint(equalTo: tutanakButton.bottomAnchor, constant: 20),
            sandıkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sandıkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sandıkButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    fileprivate func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = Constant.appColor
        present(safariVC, animated: true)
    }

    @objc private func tutanakButtonPressed() {
        let alert = UIAlertController(title: "Oy ve Ötesi", message: "Oy ve ötesi web sitesine gitmek istediğinize emin misiniz?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "İptal", style: .cancel))
        alert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { [weak self] _ in
            guard let self, let url = URL(string: "http://tutanak.oyveotesi.org") else { return }
            self.presentSafariVC(with: url)
        }))
        
        present(alert, animated: true)
    }
    
    @objc private func sandıkButtonPressed() {
        let alert = UIAlertController(title: "Sandık Takip Sistemi", message: "Sandık Takip Sistemi web sitesine gitmek istediğinize emin misiniz?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "İptal", style: .cancel))
        alert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { [weak self] _ in
            guard let self, let url = URL(string: "http://sts.chp.org.tr/") else { return }
            presentSafariVC(with: url)
        }))
        
        present(alert, animated: true)
    }
}
