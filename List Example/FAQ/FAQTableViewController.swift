//
//  FAQTableViewController.swift
//  List Example
//
//  Created by GL on 6/19/20.
//  Copyright © 2020 GL. All rights reserved.
//

import UIKit

class FAQTableViewController: UITableViewController {

    var source: [CellModelable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let questionNib = UINib(nibName: "QuestionCell", bundle: nil)
        tableView.register(questionNib, forCellReuseIdentifier: "QuestionCell")
        
        let answerNib = UINib(nibName: "AnswerCell", bundle: nil)
        tableView.register(answerNib, forCellReuseIdentifier: "AnswerCell")
        
        tableView.showsHorizontalScrollIndicator = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        
        self.navigationItem.title = "FAQ"
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = source[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: data.identifier, for: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let data = source[indexPath.row]
        (cell as? AppCellRepresentable)?.setup(text: data.title)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let data = source[indexPath.row] as? QuestionEntity else {
            deleteRow(at: indexPath)
            changeQuestionState(at: indexPath.row - 1)
            return
        }
        
        if data.isSelected {
            deleteRow(at: IndexPath.init(row: indexPath.row + 1, section: indexPath.section))
        } else {
            addNewCell(at: indexPath, model: data.answer)
        }
        
        data.isSelected.reverse()
    }
    
    func changeQuestionState(at index: Int) {
        (source[index] as? QuestionEntity)?.isSelected.reverse()
    }

    func deleteRow(at indexPath: IndexPath) {
        source.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .fade)
    }

    func addNewCell(at indexPath: IndexPath, model: CellModelable) {
        source.insert(model, at: indexPath.row + 1)
        tableView.insertRows(at: [IndexPath(row: indexPath.row + 1, section: indexPath.section)], with: .top)
    }
}
