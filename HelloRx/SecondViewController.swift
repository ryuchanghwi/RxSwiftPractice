//
//  SecondViewController.swift
//  HelloRx
//
//  Created by 류창휘 on 2022/08/12.
//

import Foundation
import UIKit
import SnapKit
import Photos

class SecondViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) else { fatalError("not found")}
    }
    
    
    lazy private var collectionView = UICollectionView()
    
    private var images = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(collectionView)
        
        populatePhotos()
        collectionViewSetting()
    }
    
    private func collectionViewSetting() {
        collectionView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.leading.top.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    private func populatePhotos() {
        
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            if status == .authorized {
                //Access the photos from photo library
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                
                assets.enumerateObjects { (object, count, stop) in
                    self?.images.append(object)
                    self?.collectionView.reloadData()
                    
                }
            }
        }
    }
}
