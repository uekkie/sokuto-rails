class AddCreditScoreToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :credit_score, :integer, null: false, default: 1
  end
end
