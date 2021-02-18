class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table   :comments do |t|
      t.text       :content
      t.string     :image
      t.string     :title
      t.references :user,      null: false, foreign_key: true
      t.references :micropost, null: false, foreign_key: true

      t.timestamps
    end
  end
end
