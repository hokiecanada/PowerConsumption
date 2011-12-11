class AddFieldsToOutlet < ActiveRecord::Migration
  def change
	add_column :outlets, :second, :float
	add_column :outlets, :minute, :float
	add_column :outlets, :hour, :float
	add_column :outlets, :day, :float
	add_column :outlets, :week, :float
	add_column :outlets, :month, :float
  end
end
