ActiveAdmin.register Ecm::Staff::Organisation do
  menu :parent => Proc.new { I18n.t('ecm.staff.active_admin.menu') }.call

  form do |f|
    f.translate_inputs do |t|
      t.input :name
      t.input :description
    end # f.inputs

    f.inputs do
      f.input :markup_language, :as => :select, :collection => Ecm::Staff::Configuration.markup_languages.map(&:to_s)
    end # f.inputs

    f.actions
  end # form

  index do
    selectable_column
    column :name
    column :description
    column :created_at
    column :updated_at
    default_actions
  end # index

  show :title => :to_s do
    I18n.available_locales.each do |locale|
      panel "#{Ecm::Staff::Organisation.human_attribute_name(:description)} - #{locale}" do
        Globalize.with_locale(locale) { ecm_staff_organisation.description.to_html.html_safe }
      end
    end

    panel Ecm::Staff::Organisation.human_attribute_name(:business_units) do
      table_for ecm_staff_organisation.business_units, :i18n => Ecm::Staff::BusinessUnit do
        sortable_tree_columns
        sortable_tree_indented_column :name
        column :people_count
        column :description
        column :created_at
        column :updated_at
        column do |bu|
          link_to(I18n.t('active_admin.view'), [:admin, bu], :class => "member_link view_link") +
          link_to(I18n.t('active_admin.edit'), [:edit, :admin, bu], :class => "member_link edit_link")
        end # column
      end # table_for
    end # panel
  end # show

  sidebar Ecm::Staff::Organisation.human_attribute_name(:details), :only => :show do
    attributes_table_for ecm_staff_organisation do
      I18n.available_locales.each do |locale|
        Globalize.with_locale(locale) { row :name }
      end
      row :markup_language
      row :created_at
      row :updated_at
    end
  end # sidebar
end if defined?(ActiveAdmin)
