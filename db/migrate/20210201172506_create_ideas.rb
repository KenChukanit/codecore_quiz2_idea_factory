class CreateIdeas < ActiveRecord::Migration[6.1]
  def change
    create_table :ideas do |t|

      t.timestamps
    end
  end
end
