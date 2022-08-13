//
//  ViewController.swift
//  HelloRx
//
//  Created by 류창휘 on 2022/08/11.
//

import UIKit
import SnapKit
import RxSwift
import SwiftUI

class ViewController: UIViewController {
    
    lazy var rightButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonClicked(_:)))
        
        return button
    }()
    
    lazy var imageView = UIImageView()
    
    lazy var filterButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(imageView)
        view.addSubview(filterButton)
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        self.title = "Camera Filter"
        
        
        imageView.backgroundColor = .yellow
        
        buttonSetting()
        imageViewSetting()
        
    }
    
    
    
    func imageViewSetting() {
        imageView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.75)
            make.leading.top.equalTo(self.view.safeAreaLayoutGuide)
        }
    }

    func buttonSetting() {
        self.navigationItem.rightBarButtonItem = self.rightButton
        
        filterButton.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        filterButton.backgroundColor = .blue
        filterButton.setTitle("Filter Applay", for: .normal)
        filterButton.addTarget(self, action: #selector(filterButtonClicked(_:)), for: .touchUpInside)
    }
        
    
    @objc private func buttonClicked(_ sender: Any) {
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc private func filterButtonClicked(_ sender: Any) {
        
    }

}



extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}

struct MyViewController_PreViews: PreviewProvider {
    static var previews: some View {
        ViewController().toPreview()
    }
}
