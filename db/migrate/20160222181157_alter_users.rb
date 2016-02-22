class AlterUsers < ActiveRecord::Migration
  def change
  	rename_table("users", "admin_users")
  	add_column("admin_users", "username", :string, :limit => 25, :after => "email")
  	change_column("admin_users", "email", :string, :limit => 100)
  	rename_column("admin_users", "password", "hashed_password")
  	puts "*** Adding an Index is Next ***"
  	add_index("admin_users", "username")
  end
end
