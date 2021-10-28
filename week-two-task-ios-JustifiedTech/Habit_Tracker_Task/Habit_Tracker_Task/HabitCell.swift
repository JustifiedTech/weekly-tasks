

import UIKit

class HabitCell: UITableViewCell {
    
  @IBOutlet var habitLabel: UILabel!
 @IBOutlet var habitTimeLabel: UILabel!
  @IBOutlet var leadingIcon: UIImageView!
  @IBOutlet var trailingIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
