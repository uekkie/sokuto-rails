class AddProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduce, :text, default: '', null: false
    add_column :users, :live_in, :string, default: '', null: false
  end
end
