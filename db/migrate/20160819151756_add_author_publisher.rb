class AddAuthorPublisher < ActiveRecord::Migration[5.0]
  def change
    add_reference :authors, :publisher, foreign_key: true
  end
end
