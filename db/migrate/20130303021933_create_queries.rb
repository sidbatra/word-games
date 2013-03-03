class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :text
      t.string :ip
      t.integer :operation

      t.timestamps
    end
    add_index :queries, :operation
  end
end
