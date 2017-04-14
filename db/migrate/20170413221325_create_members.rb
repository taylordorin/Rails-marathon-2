class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.belongs_to :house
      t.timestamps
    end
  end
end
