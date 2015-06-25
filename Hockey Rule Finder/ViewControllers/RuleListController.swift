//
//  RuleListController.swift
//  Hockey Rule Finder
//
//  Created by Brian Maxwell on 6/12/15.
//  Copyright (c) 2015 Brian Maxwell. All rights reserved.
//

class RuleListController: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    let tableData = ["R1", "R2", "R3"];
    var selectedIndex = 0;
    var prefix = "";
    
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
        cell.textLabel!.text = prefix + " " + tableData[indexPath.row];
        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedIndex = indexPath.row;
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("main", forIndexPath:indexPath) as! UITableViewCell;
        self.performSegueWithIdentifier("to_rule_detail", sender: cell);
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "to_rule_detail") {
            if let viewController: RuleDetailController = segue.destinationViewController as? RuleDetailController {
                let cell:UITableViewCell = sender as! UITableViewCell;
                viewController.prefix = tableData[selectedIndex];
            }
        }
    }
}
