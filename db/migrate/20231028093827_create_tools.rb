class CreateTools < ActiveRecord::Migration[6.1]
  def change
    create_table :tools do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
