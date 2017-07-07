class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""

      t.timestamps
    end

    add_index :posts, :title
  end
end
