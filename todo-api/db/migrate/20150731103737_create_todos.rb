class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
