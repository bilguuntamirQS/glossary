ActiveAdmin.register Category do
  permit_params :category_name, :category_name_mn, :category_id, :user_id, :updated, :deleted

  form do |f|
    f.object.updated = DateTime.now
    f.inputs do
      f.input :category_name, as: :string
      f.input :category_name_mn, as: :string
      f.input :category, as: :select, collection: Category.where(category: [nil, ""]), required: false
      f.input :user, as: :select, collection: User.all #.collect { |user| [user.user_name]}
      f.input :updated, as: :hidden
    end
    f.actions
  end
  end
