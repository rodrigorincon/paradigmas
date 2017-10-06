class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :nome
      t.integer :prioridade
      t.string :descricao
      t.integer :status

      t.integer  :criador_id
      t.integer  :finalizador_id
      
      t.timestamps null: false
    end
  end
end
