class AddPropabilityAndOfferIdToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :propability, :integer
    add_column :images, :offer_id, :string
  end
end
