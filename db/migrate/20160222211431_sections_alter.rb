class SectionsAlter < ActiveRecord::Migration
  def change
  	add_column("sections", "name", :string)
  	add_column("sections", "position", :integer)
  	add_column("sections", "visible", :boolean)
  	add_column("sections", "content_type", :string)
  	add_column("sections", "content", :text)
  end
end
