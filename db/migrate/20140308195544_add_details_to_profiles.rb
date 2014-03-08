class AddDetailsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :hometown, :string
    add_column :profiles, :age, :string
  end
end
