# app/admin/words.rb
ActiveAdmin.register Word do
  permit_params :word, :user_id, word_categories_attributes: [:id, :word_id, :category_id, :_destroy]

  form do |f|
    f.inputs 'Word' do
      f.input :user, as: :select, collection: User.all.map { |u| [u.user_name, u.id] }
      f.input :word, as: :string
      f.has_many :word_categories, allow_destroy: true do |ff|
        ff.input :category, as: :select, collecton: Category.all.map { |c| [c.category_name, c.id] }
      end
    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :word
    column :user
    column "Categories" do |c|
      WordCategory.where(word: c.id).map { |w| Category.where(id: w.category).map { |a| a.category_name}}.join(", ")
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do 
      row :word
      row "Categories" do |c|
        WordCategory.where(word: c.id).map { |w| Category.where(id: w.category).map { |a| a.category_name}}.join(", ")
      end
      row :created_at
      row :updated_at
    end
  end
end