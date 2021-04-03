class AddRoomReferencesToMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :room, foreign_key: true, nil: false
  end
end
