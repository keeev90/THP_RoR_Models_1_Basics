class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.string :genre
      t.text :synopsis
      t.string :director
      t.float :allocine_rating #score "spectateur" visible sur allocine.fr
      t.integer :my_rating #score personnel sur le film 
      t.boolean :already_seen
      t.timestamps
    end
  end
end
