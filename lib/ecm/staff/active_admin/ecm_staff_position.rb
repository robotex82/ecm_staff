ActiveAdmin.register Ecm::Staff::Position do
  menu :parent => Proc.new { I18n.t('ecm.staff.active_admin.menu') }.call

  # Nested set settings
  config.sort_order = 'lft_asc'
  sortable_tree_member_actions

  form do |f|
    f.inputs do
      f.input :parent, :as => :select, :collection => nested_set_options(Ecm::Staff::Position, f.object) { |p| "#{'&#160;&#160;&#160;&#160;' * p.depth}&bull; #{p.to_s}".html_safe }
    end # f.inputs

    f.inputs do
      f.input :name
      f.input :description
    end # f.inputs

#    f.inputs do
#      f.input :markup_language, :as => :select, :collection => Ecm::References::Configuration.markup_languages.map(&:to_s)
#    end # f.inputs

    f.actions
  end # form

  index do
    selectable_column
    sortable_tree_columns
    sortable_tree_indented_column :name
    column :people_count
    column :description
    column :created_at
    column :updated_at
    default_actions
  end # index

  show do
    I18n.available_locales.each do |locale|
      panel "#{Ecm::Staff::Position.human_attribute_name(:description)} - #{locale}" do
        Globalize.with_locale(locale) { mu(ecm_staff_position, :description) }
      end # panel
    end # I18n.available_locales

    panel Ecm::Staff::Position.human_attribute_name(:person_positions) do
      table_for ecm_staff_position.person_positions, :i18n => Ecm::Staff::PersonPosition do
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

  sidebar Ecm::Staff::Position.human_attribute_name(:details), :only => :show do
    attributes_table_for ecm_staff_position do
      row :name
      row :parent
      row :depth
      row :markup_language
      row :created_at
      row :updated_at
    end
  end # sidebar
end
