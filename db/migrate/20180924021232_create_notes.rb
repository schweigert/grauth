class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title, null: false, default: ''
      t.string :body, null: false, default: ''
      t.belongs_to :user, index: true
    end
  end
end
