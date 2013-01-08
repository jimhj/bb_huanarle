class CreateTotalTable < ActiveRecord::Migration
  def up
    create_table :totals do |t|
      t.integer :id
      t.string :remarks
      t.integer :consumptions_count, :default => 0
      t.decimal :total_cost, :default => 0.00, :precision => 10, :scale => 2
      t.string :date
      t.timestamps      
    end    
  end

  def down
  end
end
