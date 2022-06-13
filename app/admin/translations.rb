ActiveAdmin.register Translation do
  permit_params :word, :translation, :term, :category, :user

  form do |f|
    f.inputs do
      f.input :user, as: :select, collection: User.all.map { |u| [u.user_name, u.id]}
      f.input :word, as: :select, collection: Word.all.map { |u| [u.word, u.id]}
      f.input :category, as: :select, collection: Category.all.map { |u| [u.category_name, u.id]}
      f.input :translation, as: :string
      f.input :term, as: :string
    end
    f.actions
  end

  controller do
    def create
      translation = Translation.create!(permitted_params[:translation])
      if_exist = WordCategory.where(word: translation.word, category: translation.category)
      if if_exist.nil?
      else
        WordCategory.create(word: translation.word, category: translation.category)
      end
      translation.save
      flash[:notice] = 'Амжилттай хадгаллаа'
      redirect_to admin_translations_path and return
    end
  end
end
