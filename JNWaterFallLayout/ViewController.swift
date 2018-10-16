//
//  ViewController.swift
//  JNWaterFallLayout
//
//  Created by 钱海超 on 2018/10/12.
//  Copyright © 2018年 北京大账房信息技术有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    fileprivate lazy var collectionView: UICollectionView = {

        let layout = JNWaterFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.dataSource = self
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)

        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
//        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        return collectionView

    }()




    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
    }

}

extension ViewController : JNWaterFlowLayoutDataSource {
    func numberOfColsInWaterFlowLayout(_ layout: JNWaterFlowLayout) -> Int {
        return 3
    }
    func waterFlowLayout(_ layout: JNWaterFlowLayout, indexPath: IndexPath) -> CGFloat {
        return indexPath.item % 2 == 0 ? kScreenW * 2 / 3 : kScreenW * 0.5
    }
}


extension ViewController : UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = UIColor.gray
        return cell
    }
}

