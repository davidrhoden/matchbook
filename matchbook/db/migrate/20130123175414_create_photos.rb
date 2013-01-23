class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.text :caption
      t.string :user_id
      t.string :integer

      t.timestamps
    end
  end
end
