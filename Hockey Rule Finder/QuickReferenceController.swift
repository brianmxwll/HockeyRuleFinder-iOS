//
//  QuickReferenceController.swift
//  Hockey Rule Finder
//
//  Created by Brian Maxwell on 6/11/15.
//  Copyright (c) 2015 Brian Maxwell. All rights reserved.
//

class QuickReferenceController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    let tableData = ["Q1", "Q2", "Q3"];
    
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
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell");
        cell.textLabel!.text = tableData[indexPath.row];
        return cell;
    }
    
}

