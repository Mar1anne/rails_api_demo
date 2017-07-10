ActiveAdmin.register Post do

  permit_params :title, :description, :user_id

end
