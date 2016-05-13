class CreateCatRentalRequests < ActiveRecord::Migration
  def change
    create_table :cat_rental_requests do |t|
      t.references :cat, index: true, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :status, default: "PENDING", presence: true

      t.timestamps null: false
    end

    
  end
end
