class RemoveDateFromRequests < ActiveRecord::Migration
  def change
    remove_column :requests, :date, :date
    remove_column :requests, :time, :time
    remove_column :requests, :location, :string
    remove_column :requests, :date_acceptance, :boolean
    remove_column :requests, :time_acceptance, :boolean
    remove_column :requests, :location_acceptance, :boolean
  end
end
