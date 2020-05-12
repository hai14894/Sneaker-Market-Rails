class AddSizeToListing < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :size, foreign_key: true
  end
end
