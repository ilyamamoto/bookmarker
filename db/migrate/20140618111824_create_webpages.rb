class CreateWebpages < ActiveRecord::Migration
  def change
    create_table :webpages do |t|
      t.text	 :url,			null: false
      t.string :title,		null: false
      t.text	 :html,			null: false
      t.text	 :content,	null: false

      t.timestamps
    end

  end
end
