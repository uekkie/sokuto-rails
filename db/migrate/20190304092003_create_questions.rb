class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content, default: "", null: false
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
