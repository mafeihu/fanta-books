class AddDownloadToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :download, :string
  end
end
