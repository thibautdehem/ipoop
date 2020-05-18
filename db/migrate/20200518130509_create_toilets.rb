class CreateToilets < ActiveRecord::Migration[6.0]
  def change
    create_table :toilets do |t|
      t.string :address
      t.string :style
      t.string :description

      t.timestamps
    end
  end
end
