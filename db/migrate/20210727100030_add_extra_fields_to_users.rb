class AddExtraFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fullname, :string
    add_column :users, :organization, :string
    add_column :users, :language, :string
    add_column :users, :about, :text
    add_column :users, :status, :boolean, default: false
  end
end
