class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :correct

      t.timestamps
    end
  end
end
