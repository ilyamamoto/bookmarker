class RemoveHtmlFromWebpages < ActiveRecord::Migration
  def change
		remove_column :webpages, :html, :text
  end
end
