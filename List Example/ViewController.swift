import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    var texts = ["tett", "kjghksdj", "nkjdhkd"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        texts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifier: String {
            if (indexPath.section + indexPath.row) % 2 == 0 {
                return "red"
            } else {
                return "green"
            }
        }
        
        return tableView.dequeueReusableCell(withIdentifier: "green", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? MyTableViewCell)?.setup(text: texts[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Header \(section)"
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "Footer \(section)"
    }
}
