ActiveAdmin.register Location do

  includes :users, :posts

  filter :city

  form do |f|
    f.inputs do
      f.input :city
      f.input :latitude
      f.input :longitude
    end
    f.actions
  end

end
