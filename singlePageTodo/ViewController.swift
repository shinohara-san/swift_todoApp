import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var todoTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var array = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TodoCell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        TodoCell.textLabel?.text = array[indexPath.row]
        return TodoCell
    }
    //    削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        array.remove(at: indexPath.row)
//        print("delete: \(array)")
//        削除した後、削除された状態の配列を保存
        UserDefaults.standard.set(array, forKey: "TodoList")
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            array = UserDefaults.standard.object(forKey: "TodoList") as! [String]
            
//            print("viewDid: \(array)")
        }
    }
    
    @IBAction func todoAddButton(_ sender: Any) {
        //        print("Tapped!")
        if let todoText = todoTextField.text {
            array.append(todoText)
            UserDefaults.standard.set(array, forKey: "TodoList")
            todoTextField.text = ""
//            print("save: \(array)")
        }else{
            return
        }
        array = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        tableView.reloadData()
//        print("get: \(array)")
        
    }
}

