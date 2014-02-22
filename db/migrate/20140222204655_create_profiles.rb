class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :bio, limit: 100
      t.belongs_to :user, index: true, null: false
      t.timestamps
    end
  end
end
