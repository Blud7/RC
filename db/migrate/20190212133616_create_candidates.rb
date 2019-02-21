class CreateCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :candidates do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.integer "salary"
      t.date "nl_date"
      t.boolean "hired"

      t.timestamps
    end
  end
end
