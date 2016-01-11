class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string  :name
      t.string  :text
      t.integer :project_id
      t.integer :priority, default: 0
      t.string  :status, default: 'new'
      t.date    :deadline

      t.timestamps null: false
    end
  end
end
