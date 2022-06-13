ActiveAdmin.register Category do
  permit_params :category_name, :category_name_mn, :category_id, :user_id

  form do |f|
    f.inputs do
      f.input :category_name, as: :string
      f.input :category_name_mn, as: :string
      f.input :category, as: :select, collection: Category.where(category: [nil, ""]).map { |c| [c.category_name, c.id]}, required: false
      f.input :user, as: :select, collection: User.all.map { |u| [u.user_name, u.id] }
    end
    f.actions
  end
  end
