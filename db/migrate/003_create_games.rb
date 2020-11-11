class CreateGames < ActiveRecord::Migration[4.2]
    def change
      create_table :games do |t|
        t.text  :game_intro
        t.integer :opener_id
        
  
        t.timestamps
      end
    end
  end
  