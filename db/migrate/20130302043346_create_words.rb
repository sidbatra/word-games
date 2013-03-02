class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :text
      t.string :sorted_text

      t.timestamps
    end

    add_index :words, :text, :unique => true
    add_index :words, :sorted_text
  end
end
