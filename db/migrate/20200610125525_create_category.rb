class CreateCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category
    end
  end
end
