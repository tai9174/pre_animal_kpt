class CreateKpts < ActiveRecord::Migration[6.0]
  def change
    create_table :kpts do |t|
      t.text :keep_content
      t.integer :keep_status
      t.text :problem_content
      t.integer :problem_status
      t.text :try_content
      t.integer :try_status
      t.boolean :favorite

      t.timestamps
    end
  end
end
