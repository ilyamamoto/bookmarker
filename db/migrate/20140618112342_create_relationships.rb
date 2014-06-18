class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :keyword_id, null: false
      t.integer :webpage_id, null: false
      t.decimal :significance, null: false

      t.timestamps
    end

		add_index :relationships, :keyword_id
		add_index :relationships, :webpage_id
		add_index :relationships, [:webpage_id, :keyword_id], unique: true
  end
end
