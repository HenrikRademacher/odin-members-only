class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.timestamps
      t.string :title
      t.string :content
      t.string :author
      t.belongs_to :user, foreign_key: true
    end
  end
end
