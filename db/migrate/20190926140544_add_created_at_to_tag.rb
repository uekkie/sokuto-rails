class AddCreatedAtToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :created_at, :datetime
  end
end
