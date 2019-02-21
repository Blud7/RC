class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.belongs_to :firm
      t.belongs_to :candidate
      
      t.timestamps
    end
  end
end
