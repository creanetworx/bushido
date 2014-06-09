class AddRubColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :rub, :string
  end
end
