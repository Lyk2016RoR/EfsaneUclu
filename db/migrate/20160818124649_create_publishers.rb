class CreatePublishers < ActiveRecord::Migration[5.0]
  def change
    create_table :publishers do |t|
      t.string :name
      t.integer :established_year
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end
