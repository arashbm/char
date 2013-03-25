class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.references :blueprint, index: true
      t.references :user, index: true
      t.text :body

      t.timestamps
    end
  end
end
