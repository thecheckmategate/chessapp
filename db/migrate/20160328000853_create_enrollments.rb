class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :game_id 
      t.integer :user_id 

      t.timestamps
    end
   	  add_index :enrollments, [:user_id, :game_id]
   	  add_index :enrollments, [:game_id]
  end
end
