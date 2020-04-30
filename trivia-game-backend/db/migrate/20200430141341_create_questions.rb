class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question_text
      t.string :correct_answer
      t.string :incorrect_answers
      t.timestamps
    end
  end
end
