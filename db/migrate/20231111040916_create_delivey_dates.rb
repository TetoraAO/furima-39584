class CreateDeliveyDates < ActiveRecord::Migration[7.0]
  def change
    create_table :delivey_dates do |t|

      t.timestamps
    end
  end
end
