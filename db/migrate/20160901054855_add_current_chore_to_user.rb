class AddCurrentChoreToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :chore, foreign_key: true
  end
end
