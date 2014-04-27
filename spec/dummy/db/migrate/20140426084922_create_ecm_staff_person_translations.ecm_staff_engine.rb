# This migration comes from ecm_staff_engine (originally 9)
class CreateEcmStaffPersonTranslations < ActiveRecord::Migration
  def up
    Ecm::Staff::Person.create_translation_table!({
      :prefix => :string,
      :description => :text,
      :slug => :string
    }, {
      :migrate_data => true
    })
  end

  def down
    Ecm::Staff::Person.drop_translation_table!( :migrate_data => true )
  end
end
