class AddBypassHumanizerToComments < ActiveRecord::Migration
  def change
    add_column :comments, :bypass_humanizer, :boolean, default: false
  end
end
