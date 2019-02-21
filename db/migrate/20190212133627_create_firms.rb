class CreateFirms < ActiveRecord::Migration[5.2]
  def change
    create_table :firms do |t|
      t.string "name"
      t.boolean "recruiter"

      t.timestamps
    end
  end
end
