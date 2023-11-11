class CreateDeliveyCharges < ActiveRecord::Migration[7.0]
  def change
    create_table :delivey_charges do |t|

      t.timestamps
    end
  end
end
