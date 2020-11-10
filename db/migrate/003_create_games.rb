class CreateGames < ActiveRecord::Migration[6.0]
    def change
      create_table :games do |t|
        t.text  :game_intro
        t.integer :hits
        t.integer :opener_id
        t.integer :extra_shooting_speed
        t.integer :three_extra_hp
        
        
        t.timestamps
      end
    end
  end
  