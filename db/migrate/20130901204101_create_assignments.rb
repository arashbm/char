class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :assignee, index: true
      t.references :blueprint, index: true

      t.timestamps
    end
  end
end
