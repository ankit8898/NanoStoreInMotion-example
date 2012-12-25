class AllUsersViewController < UITableViewController

USERS_CELL_REUSE_ID = "UsersCellId"

  def initWithStyle(style)
    super
    self.title = "All Users"
    self
  end

  def viewWillAppear(animated)
    @users =  User.all
    self.tableView.reloadData
  end
 
 def tableView(tableView, numberOfRowsInSection:section)
   @users.length
end


def tableView(tableView, cellForRowAtIndexPath:indexPath)
  cell = tableView.dequeueReusableCellWithIdentifier(USERS_CELL_REUSE_ID) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: USERS_CELL_REUSE_ID)
  user_item = @users[ indexPath.row ]
  cell.textLabel.text = user_item.name
  cell.detailTextLabel.text = user_item.email
  cell
end
end