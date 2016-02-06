class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.belongs_to :library, index: true, foreign_key: true
      t.string :name
      t.text :description
      t.boolean :public

      t.timestamps null: false
    end
  end
end
