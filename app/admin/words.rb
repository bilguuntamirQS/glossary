# app/admin/words.rb
ActiveAdmin.register Word do
  permit_params :word, :user_id, word_category_attributes: [:id, :category_id]

  form do |f|
    f.object.updated = DateTime.now
    f.inputs 'Word' do
      f.input :user, as: :select, collection: User.all
      f.input :word, as: :string
    end

    f.inputs do
      f.has_many :word_categories do |ff|
        ff.input :category_id, as: select, collection: []
      end
    end
    
    f.actions
  end
end
