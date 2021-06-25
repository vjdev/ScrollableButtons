//
//  ScrollableCollectionViewCell.swift
//  ScrollableButtons
//
//  Created by Vijeesh on 25/06/21.
//

import UIKit

class ScrollableCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var scrollableButton: UIButton!
    @IBOutlet private weak var buttonContainerView: UIView!
    
    var delegate: ScrollableButtonsProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    @IBAction func scrollableButtonClciked(_ sender: Any) {
        let button = sender as! UIButton
        delegate?.didSelectButtonAtIndex(button.tag)
    }
}
