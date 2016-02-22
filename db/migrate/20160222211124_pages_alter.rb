class PagesAlter < ActiveRecord::Migration
  def change
  	# add_column("pages", "name", :string)
  	add_column("pages", "permalink", :integer)
  	add_column("pages", "position", :integer)
  	add_column("pages", "visible", :boolean)
  end
end
