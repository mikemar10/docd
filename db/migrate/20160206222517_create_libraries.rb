class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.references :documents, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
