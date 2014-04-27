ActiveAdmin.register Ecm::Staff::PersonPosition do
  menu :parent => Proc.new { I18n.t('ecm.staff.active_admin.menu') }.call

  form do |f|
    f.inputs do
      f.input :person
      f.input :business_unit
      f.input :position
    end # f.inputs

    f.inputs do
      f.input :begin_at, :as => :datepicker
      f.input :end_at, :as => :datepicker
    end # f.inputs

#    f.inputs do
#      f.input :markup_language, :as => :select, :collection => Ecm::References::Configuration.markup_languages.map(&:to_s)
#    end # f.inputs

    f.actions
  end # form

  index do
    selectable_column
    column :position
    column :person
    column :organisation
    column :business_unit
    column :begin_at
    column :end_at
    default_actions
  end # index

  show do
    I18n.available_locales.each do |locale|
      panel "#{Ecm::Staff::Position.human_attribute_name(:description)} - #{locale}" do
        Globalize.with_locale(locale) { mu(ecm_staff_person_position.position, :description) }
      end
    end
  end # show

  sidebar Ecm::Staff::PersonPosition.human_attribute_name(:details), :only => :show do
    attributes_table_for ecm_staff_person_position do
      row :person
      row :business_unit
      row :position
      row :begin_at
      row :end_at
      row :created_at
      row :updated_at
    end
  end # sidebar
end
