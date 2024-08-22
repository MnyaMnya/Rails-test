class AddOwnerToArticles < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :owner, :string
  end
end
