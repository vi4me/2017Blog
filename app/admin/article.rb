ActiveAdmin.register Article do
  permit_params :title, :comments

  index do
    selectable_column
    id_column
    column :title
    column :comments
    column :updated_at
    column :created_at
    actions
  end

  filter :title

  form do |f|
    f.inputs "title" do
      f.input :title
      f.input :comments
    end
    f.actions
  end
end