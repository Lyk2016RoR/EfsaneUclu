class AddPublisherAuthor < ActiveRecord::Migration[5.0]
  def change
    add_reference :publishers, :author, foreign_key: true
  end
end
