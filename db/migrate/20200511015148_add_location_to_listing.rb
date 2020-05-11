class AddLocationToListing < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :location, foreign_key: true
  end
end
