class AddOnBlogToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :on_blog, :boolean
  end
end
