//
//  ScrollableButtonsView.swift
//  ScrollableButtons
//
//  Created by Vijeesh on 25/06/21.
//

import UIKit

class ScrollableButtonsView: UIView {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var scrollableCollectionView: UICollectionView!
    var delegate: ScrollableButtonsProtocol?
    
    private let identifer = "\(ScrollableCollectionViewCell.self)"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialize()
    }
    
    private func initialize() {
        let name = String(describing: type(of: self))
        let nib = UINib(nibName: name, bundle: .main)
        nib.instantiate(withOwner: self, options: nil)
        
        self.addSubview(containerView)
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let nib = UINib(nibName: "\(ScrollableCollectionViewCell.self)", bundle: Bundle.main)
        scrollableCollectionView.register(nib, forCellWithReuseIdentifier: identifer)
    }
}

extension ScrollableButtonsView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.arrayOfButtonNames.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifer, for: indexPath) as? ScrollableCollectionViewCell
        let title = delegate?.arrayOfButtonNames[indexPath.row]
        cell?.scrollableButton.setTitle(title, for: .normal)
        cell?.scrollableButton.tag = indexPath.row
        cell?.delegate = self
        cell?.scrollableButton.layer.cornerRadius = 5
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = delegate?.arrayOfButtonNames[indexPath.row]
        if let width = title?.size(withAttributes:[.font: UIFont.systemFont(ofSize: 30.0)]).width {
            return CGSize(width: width + 10, height: 100)
        }
        return CGSize(width: 10, height: 100)
    }
}

extension ScrollableButtonsView: ScrollableButtonsProtocol {
    var arrayOfButtonNames: [String] {
        return [""]
    }
    
    func didSelectButtonAtIndex(_ index: Int) {
        delegate?.didSelectButtonAtIndex(index)
    }
}

protocol ScrollableButtonsProtocol {
    var arrayOfButtonNames: [String] {get}
    
    func didSelectButtonAtIndex(_ index: Int)
}
