class CreateWebpages < ActiveRecord::Migration
  def change
    create_table :webpages do |t|
      t.text :url
      t.string :title
      t.text :html
      t.text :content

      t.timestamps
    end
  end
end
