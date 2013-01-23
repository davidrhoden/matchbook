class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :band
      t.integer :user_id
      t.text :description

      t.timestamps
    end
  end
end
