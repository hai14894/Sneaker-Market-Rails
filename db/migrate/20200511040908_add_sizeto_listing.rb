class AddSizetoListing < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :size, :integer
  end
end
