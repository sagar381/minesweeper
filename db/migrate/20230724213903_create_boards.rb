class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :email, null: false, limit: 50
      t.integer :mines, array: true, null: false
      t.integer :rows, null:false
      t.integer :cols, null:false

      t.timestamps
    end
  end
end