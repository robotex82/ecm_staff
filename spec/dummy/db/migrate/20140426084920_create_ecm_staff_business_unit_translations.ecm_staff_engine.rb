# This migration comes from ecm_staff_engine (originally 7)
class CreateEcmStaffBusinessUnitTranslations < ActiveRecord::Migration
  def up
    Ecm::Staff::BusinessUnit.create_translation_table!({
      :name => :string,
      :description => :text,
      :slug => :string
    }, {
      :migrate_data => true
    })
  end

  def down
    Ecm::Staff::BusinessUnit.drop_translation_table!( :migrate_data => true )
  end
end
