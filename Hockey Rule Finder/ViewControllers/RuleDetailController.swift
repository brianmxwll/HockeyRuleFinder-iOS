//
//  RuleDetailController.swift
//  Hockey Rule Finder
//
//  Created by Brian Maxwell on 6/14/15.
//  Copyright (c) 2015 Brian Maxwell. All rights reserved.
//

class RuleDetailController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var tableData = [Rule]();
    var ruleId = -1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.tableData.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"main");
        cell.textLabel!.text = tableData[indexPath.row].text;
        return cell;
    }
    
    func setData(data: [Rule]) {
        tableData = data;
    }
}
