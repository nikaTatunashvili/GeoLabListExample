import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var myTitleLabel: UILabel!
    
    func setup(text: String) {
        myTitleLabel.text = text
    }
}
