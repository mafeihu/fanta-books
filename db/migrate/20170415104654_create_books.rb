class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books, id: :uuid, comment: '公开发行' do |t|
      t.string :title, comment: '书名'
      t.string :isbn, comment: '编号'
      t.string :external, comment: '外部编号'
      t.string :cover, comment: '封面'

      t.timestamps
    end
    add_index :books, :isbn, unique: true
  end
end
