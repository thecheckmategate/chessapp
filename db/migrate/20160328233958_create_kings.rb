class CreateKings < ActiveRecord::Migration
  def change
    create_table :kings do |t|

      t.timestamps
    end
  end
end
