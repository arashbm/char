class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :acted, index: true
      t.string :acted_type
      t.string :action
      t.belongs_to :actor, index: true
      t.text :parameters

      t.timestamps
    end
  end
end
