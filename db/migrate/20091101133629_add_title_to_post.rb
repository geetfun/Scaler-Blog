class AddTitleToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :title, :string
  end

  def self.down
  end
end
