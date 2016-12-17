class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :movieName
      t.float :price
      t.string :linkAddress
      t.string :picAddress
      t.text :description

      t.timestamps
    end
  end
end
