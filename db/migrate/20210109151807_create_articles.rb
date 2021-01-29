class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.timestamps
    end
    reversible do |dir|
      dir.up do
        Article.create_translation_table! :title => :string
      end

      dir.down do
        Post.drop_translation_table!
      end
    end
  end
end
