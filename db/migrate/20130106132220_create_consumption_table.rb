class CreateConsumptionTable < ActiveRecord::Migration
  def up
    create_table :consumptions do |t|
      t.integer :id
      t.string :tags
      t.string :desc
      t.string :date
      t.decimal :cost, :default => 0.00, :precision => 10, :scale => 2
      t.references :total
      t.timestamps      
    end
  end

  def down
  end
end
