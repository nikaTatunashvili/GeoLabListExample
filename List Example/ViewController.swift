import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    var texts = ["Green controller", "Red controller", "Blue Controller"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func goToColorable(color: UIColor) {
        let vc = ColorableController()
        vc.backgroundColor = color
        self.present(vc, animated: true, completion: nil)
    }

    func deleteRow(at indexPath: IndexPath) {
        texts.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }

    func editCell(at indexPath: IndexPath) {
        texts[indexPath.row] = "თიკოს უნდოდა შეცვლა"
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    func addNewCell(at indexPath: IndexPath) {
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            switch indexPath.row {
            case 0:
                self.goToColorable(color: .green)
            case 1:
                self.goToColorable(color: .red)
            case 2:
                self.goToColorable(color: .blue)
            default:
                break
            }
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return [
            UITableViewRowAction(style: .destructive, title: "Delete") { action, path in
                self.deleteRow(at: path)
            },
            UITableViewRowAction(style: .default, title: "Call") { action, path in
                self.editCell(at: path)
            },
            UITableViewRowAction(style: .normal, title: "red") { action, path in
                print(path)
            }
        ]
    }
    
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
