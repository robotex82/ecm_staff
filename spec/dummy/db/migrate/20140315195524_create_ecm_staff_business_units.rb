class CreateEcmStaffBusinessUnits < ActiveRecord::Migration
  def change
    create_table :ecm_staff_business_units do |t|
      t.string :name
      t.text :description
      t.references :organisation
      t.references :parent
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.timestamps
    end
    add_index :ecm_staff_business_units, :organisation_id
    add_index :ecm_staff_business_units, :parent_id
  end
end
