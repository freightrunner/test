class SectionsIndex < ActiveRecord::Migration
  def change
  	add_index("pages", "permalink")
  	add_column("sections", "page_id", :integer)
  	add_index("sections", "page_id")
  end
end
