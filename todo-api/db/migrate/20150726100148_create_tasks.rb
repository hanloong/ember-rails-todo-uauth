class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.boolean :done

      t.timestamps null: false
    end
  end
end
