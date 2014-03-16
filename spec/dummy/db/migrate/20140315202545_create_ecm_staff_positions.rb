class CreateEcmStaffPositions < ActiveRecord::Migration
  def change
    create_table :ecm_staff_positions do |t|
      t.string :name
      t.text :description
      t.references :parent
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.timestamps
    end
    add_index :ecm_staff_positions, :parent_id
  end
end
