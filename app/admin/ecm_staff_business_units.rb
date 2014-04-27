ActiveAdmin.register Ecm::Staff::BusinessUnit do
  menu :parent => Proc.new { I18n.t('ecm.staff.active_admin.menu') }.call

  # Nested set settings
  config.sort_order = 'lft_asc'
  sortable_tree_member_actions

  form do |f|
    f.inputs do
      f.input :organisation, :as => :select, :collection => Ecm::Staff::Organisation.all.collect { |o| [ o.to_s, o.id ] }
      f.input :parent, :as => :select, :collection => nested_set_options(Ecm::Staff::BusinessUnit, f.object) { |bu| "#{'&#160;&#160;&#160;&#160;' * bu.depth}&bull; #{bu.to_s}".html_safe }
    end # f.inputs

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
    sortable_tree_columns
    column :organisation
    sortable_tree_indented_column :name
    column :people_count
    column :description
    column :created_at
    column :updated_at
    default_actions
  end # def

  show :title => :to_s do
    I18n.available_locales.each do |locale|
      panel "#{Ecm::Staff::BusinessUnit.human_attribute_name(:description)} - #{locale}" do
        Globalize.with_locale(locale) { ecm_staff_business_unit.description.to_html.html_safe }
      end
    end

    panel Ecm::Staff::BusinessUnit.human_attribute_name(:children) do
      table_for ecm_staff_business_unit.descendants, :i18n => Ecm::Staff::BusinessUnit do
      sortable_tree_columns
      column :organisation
      sortable_tree_indented_column :name
      column :people_count
      column :description
      column :created_at
      column :updated_at
        column do |child|
          link_to(I18n.t('active_admin.view'), [:admin, child], :class => "member_link view_link") +
          link_to(I18n.t('active_admin.edit'), [:edit, :admin, child], :class => "member_link edit_link")
        end
      end # table_for
    end # panel

    panel Ecm::Staff::BusinessUnit.human_attribute_name(:person_positions) do
      table_for ecm_staff_business_unit.person_positions, :i18n => Ecm::Staff::PersonPosition do
        column :position
        column :person
        column :begin_at
        column :end_at
        column :created_at
        column :updated_at
        column do |pp|
          link_to(I18n.t('active_admin.view'), [:admin, pp], :class => "member_link view_link") +
          link_to(I18n.t('active_admin.edit'), [:edit, :admin, pp], :class => "member_link edit_link")
        end # column
      end # table_for
    end # panel
  end # show

  sidebar Ecm::Staff::BusinessUnit.human_attribute_name(:details), :only => :show do
    attributes_table_for ecm_staff_business_unit do
      row :organisation
      row :parent
      row :name
      row :markup_language
      row :depth
      row :created_at
      row :updated_at
    end
  end # sidebar
end
