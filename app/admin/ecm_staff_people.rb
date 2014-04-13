include ActiveAdmin::ActsAsList::Helper

ActiveAdmin.register Ecm::Staff::Person do
  menu :parent => Proc.new { I18n.t('ecm.staff.active_admin.menu') }.call

  config.sort_order = 'position'
  sortable_member_actions

  form do |f|
    f.inputs do
      f.input :prefix
      f.input :firstname
      f.input :lastname
      f.input :birthdate, :as => :datepicker
    end

    f.inputs do
      f.input :description
    end

    f.inputs do
      f.input :markup_language, :as => :select, :collection => Ecm::Staff::Configuration.markup_languages.map(&:to_s)
    end # f.inputs

    f.inputs do
      f.has_many :person_positions do |pp|
        if pp.object.persisted?
          pp.input :_destroy, :as => :boolean, :label => I18n.t('active_admin.delete')
        end
        pp.input :business_unit
        pp.input :position

        pp.input :begin_at, :as => :datepicker
        pp.input :end_at,   :as => :datepicker
      end
    end

    form_inputs_for_pictureable(f)

    f.actions
  end # form

  index do
    selectable_column
    sortable_columns
    column :preview_picture do |ecm_staff_person|
      if ecm_staff_person.preview_picture.present?
        image_tag(ecm_staff_person.preview_picture_image_url(:small_thumb))
      else
        div(:class => 'preview-picture-placeholder') { '&#x263A'.html_safe }
      end
    end # column
    column :prefix
    column :firstname
    column :lastname
    column :age
    column :created_at
    column :updated_at
    default_actions
  end # index

  show :title => :to_s do
    panel Ecm::Staff::Person.human_attribute_name(:description) do
      ecm_staff_person.description.to_html.html_safe
    end # panel

    panel Ecm::Staff::Person.human_attribute_name(:person_positions) do
      table_for ecm_staff_person.person_positions, :i18n => Ecm::Staff::Person do
        column :position
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

    panel_for_pictureable
  end # show

  sidebar Ecm::Staff::Person.human_attribute_name(:details), :only => :show do
    attributes_table_for ecm_staff_person do
    row :preview_picture do |ecm_staff_person|
      image_tag(ecm_staff_person.preview_picture_image_url(:small_thumb)) unless ecm_staff_person.preview_picture_image_url(:small_thumb).nil?
    end
    row :prefix
    row :fullname
    row :age
    row :markup_language
    row :created_at
    row :updated_at
    end
  end # sidebar
end
