ActiveAdmin.register User do
  permit_params :user_name, :email, :password, :permission, :updated, :deleted

  form do |f|
    f.inputs do
      f.input :user_name, as: :string
      f.input :email, as: :string
      f.input :password, as: :password
      f.input :permission, as: :select, collection: User.permissions.keys
    end
    f.actions
  end
end
