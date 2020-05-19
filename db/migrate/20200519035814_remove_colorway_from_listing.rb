class RemoveColorwayFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :colorway, :string
  end
end
