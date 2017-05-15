class RemoveUniqueFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_index :books, :isbn
    add_index :books, :isbn
  end
end
