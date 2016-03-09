class AddPasswordDigestToAdminUsers < ActiveRecord::Migration
  def change
  	add_column "admin_users", "password_digest", :string
  	remove_column "admin_users", "hashed_password"
  end
end
