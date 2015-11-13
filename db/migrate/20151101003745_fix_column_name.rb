class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :animals, :type, :species
  end
end
