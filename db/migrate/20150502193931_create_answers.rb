class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :title
      t.string :content
      t.integer :votes, default: 0
      t.belongs_to :question
      t.timestamps null: false
    end
  end
end
