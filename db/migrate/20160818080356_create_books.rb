class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :topic
      t.date :year

      t.timestamps
    end
  end
end
