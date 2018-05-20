class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.text   :long_url
      t.string :short_url
      t.string :sanitized_url
      t.timestamps
    end

    add_index :urls, :short_url
    add_index :urls, :sanitized_url
  end
end
