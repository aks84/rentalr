class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :desc
      t.decimal :rent

      t.timestamps
    end
  end
end
