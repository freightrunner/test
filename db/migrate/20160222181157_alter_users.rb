class AlterUsers < ActiveRecord::Migration
  def change
  	rename_table("users", "admin_users")
  	add_column("admin_users", "username", :string, :limit => 25, :after => "email")
  end
end
