class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :form
      t.text :content
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
