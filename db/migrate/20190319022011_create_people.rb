class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :name
      t.string :type
      t.string :cpf

      t.timestamps
    end
  end
end
