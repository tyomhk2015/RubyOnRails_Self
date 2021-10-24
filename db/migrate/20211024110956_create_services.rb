class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :name
      t.string :kind
      t.string :email
      t.string :phone
      t.string :twitter

      t.timestamps
    end
  end
end
