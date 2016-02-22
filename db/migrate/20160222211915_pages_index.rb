class PagesIndex < ActiveRecord::Migration
  def change
  	# add_column("pages", "subject_id", :integer)
  	add_index("pages", "subject_id")
  end
end
