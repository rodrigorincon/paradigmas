class CreateAnexos < ActiveRecord::Migration
  def change
    create_table :anexos do |t|
      t.string :name
      t.string :path
      t.string :myme_type
      t.integer :task_id

      t.timestamps null: false
    end
  end
end
