class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :keyword_id
      t.integer :page_id
      t.decimal :significance

      t.timestamps
    end
  end
end
