class CreateOutlets < ActiveRecord::Migration
  def change
    create_table :outlets do |t|
      t.string :device
      t.integer :status

      t.timestamps
    end
  end
end
