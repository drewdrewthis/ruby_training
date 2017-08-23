class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.datetime  :date
      t.string    :title
      t.text      :description
      t.integer    :user_id

      t.timestamps
    end
  end
end
