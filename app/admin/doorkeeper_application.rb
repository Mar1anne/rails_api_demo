ActiveAdmin.register Doorkeeper::Application do

  permit_params :name, :redirect_uri

  # ActiveAdmin will name Rails Engine models with their namespaced names (ex:doorkeeper_application) which
  # will fail validation and spit back a form with errors where the fields would otherwise be valid.
  # Setting the model resource name back to 'application'.
  controller do
    resources_configuration[:self][:instance_name] = 'application'
  end

  index do
    selectable_column
    id_column
    column 'Application Name', :name
    column 'Client Id', :uid
    column 'Client Secret', :secret
    column :redirect_uri
    column :created_at
    actions
  end

  filter :name
  filter :uid
  filter :secret
  filter :redirect_uri
  filter :created_at

  form do |f|
    f.inputs "API Application Details" do
      f.input :name
      f.input :redirect_uri
    end
    f.actions
  end
end


