class CreateBlueprints < ActiveRecord::Migration
  def change
    create_table :blueprints do |t|
      t.string :title
      t.text :description
      t.integer :creator_id
      t.string :status

      t.timestamps
    end
  end
end
