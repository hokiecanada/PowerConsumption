class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :watts
      t.datetime :time
      t.references :outlet

      t.timestamps
    end
    add_index :logs, :outlet_id
  end
end
