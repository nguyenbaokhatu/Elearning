class CreateWordAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :word_answers do |t|
      t.string :content
      t.string :word_id
      t.boolean :correct

      t.timestamps
    end
  end
end
