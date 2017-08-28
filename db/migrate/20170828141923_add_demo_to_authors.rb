class AddDemoToAuthors < ActiveRecord::Migration
  def change
    add_column :authors, :demo, :boolean, default: false
  end
end
