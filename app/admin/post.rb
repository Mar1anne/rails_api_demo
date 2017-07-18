ActiveAdmin.register Post do

  includes :location
  permit_params :title, :description, :user_id, :location

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :location
      f.input :user
    end
    f.actions
  end
end
