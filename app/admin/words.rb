# app/admin/words.rb
ActiveAdmin.register Word do
  permit_params :word, :user_id, :updated, :deleted

  form do |f|
    f.object.updated = DateTime.now
    f.inputs 'Word' do
      f.input :user, as: :select, collection: User.all
      f.input :word, as: :string
      f.input :updated, as: :hidden
    end

    f.inputs do
      f.has_many :word_categories do |ff|
        ff.input :category_id, as: select, collection: []
      end
    end
    
    f.actions
  end
end
