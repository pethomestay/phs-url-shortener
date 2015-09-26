class CreateUrlShorts < ActiveRecord::Migration
  def change
    create_table :url_shorts do |t|
      t.string :code
      t.string :end_point
      t.integer :hit_count, :default => "0"

      t.timestamps null: false
    end
  end
end
