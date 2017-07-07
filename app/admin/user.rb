ActiveAdmin.register User do

  permit_params :first_name, :last_name, :nickname, :email, :password, :password_confirmation

  filter :first_name
  filter :last_name
  filter :nickname
  filter :email

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :nickname
    column :email
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :nickname
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
