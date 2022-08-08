class ChangeDataTypeColumnDescriptionFromBlogTable < ActiveRecord::Migration[6.1]
  def change
    change_column :blogs, :description, :text
  end
end
