class CreateMicroposts < ActiveRecord::Migration[6.0]
  def change
    create_table   :microposts do |t|
      t.string     :title
      t.text       :content
      t.string     :game_category
      t.string     :image
      
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
