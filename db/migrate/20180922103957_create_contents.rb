class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.integer :webpage_id
      t.string :wp_content_type
      t.text :data

      t.timestamps
    end
  end
end
