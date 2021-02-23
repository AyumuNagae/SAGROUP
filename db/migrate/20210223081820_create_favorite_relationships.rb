class CreateFavoriteRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_relationships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :micropost, null: false, foreign_key: true

      t.timestamps
    end
  end
end
