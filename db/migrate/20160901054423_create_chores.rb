class CreateChores < ActiveRecord::Migration[5.0]
  def change
    create_table :chores do |t|
      t.string :title
      t.string :tagline
      t.string :description

      t.timestamps
    end
  end
end
