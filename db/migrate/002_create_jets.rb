class CreateJets < ActiveRecord::Migration[4.2]
    def change
      create_table :jets do |t|
        t.integer :user_id
        t.integer :game_id
        t.integer :user_score
        
        t.timestamps
      end
    end
  end
  