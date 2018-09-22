class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :content_type
      t.text :data
      t.string :url

      t.timestamps
    end
  end
end
