ActiveAdmin.register User do

  includes :location
  permit_params :first_name, :last_name, :nickname, :email, :password, :password_confirmation, :location

  filter :first_name
  filter :last_name
  filter :nickname
  filter :email
  filter :location

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :nickname
    column :email
    column :created_at
    column :updated_at
    column :access_token
    column :location
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
      f.input :location
    end
    f.actions
  end
end
