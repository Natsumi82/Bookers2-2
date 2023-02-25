class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :Title
      t.string :Opinion
      t.timestamps
    end
  end
end
