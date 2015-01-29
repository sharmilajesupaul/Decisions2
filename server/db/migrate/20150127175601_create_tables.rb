class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :title
      t.string :content
      t.references :user

      t.timestamps
    end
  end
end
