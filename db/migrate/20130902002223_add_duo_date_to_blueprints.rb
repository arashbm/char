class AddDuoDateToBlueprints < ActiveRecord::Migration
  def change
    add_column :blueprints, :due_date, :datetime
  end
end
