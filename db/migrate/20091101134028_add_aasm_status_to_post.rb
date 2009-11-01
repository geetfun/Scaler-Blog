class AddAasmStatusToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :status, :string
  end

  def self.down
  end
end
