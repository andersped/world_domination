class CreateGenerators < ActiveRecord::Migration
  def change
    create_table :generators do |t|
      t.references :superhero, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
