class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :document_url
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
