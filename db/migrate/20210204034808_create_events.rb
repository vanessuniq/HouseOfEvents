class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :type
      t.date :date
      t.text :title
      t.string :host
      t.boolean :published

      t.timestamps
    end
  end
end
