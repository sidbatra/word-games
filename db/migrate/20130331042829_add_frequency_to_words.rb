class AddFrequencyToWords < ActiveRecord::Migration
  def change
    add_column :words, :frequency, :integer, :default => 0
    add_index :words, :frequency
  end
end
