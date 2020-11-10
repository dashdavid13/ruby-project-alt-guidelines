class CreateJets < ActiveRecord::Migration[4.2]
    def change
      create_table :jets do |t|
        t.integer :user_id
        t.integer :game_id
        t.integer :super_ball_id
        t.integer :user_health
        t.integer :user_score
        t.string :country_color
        
        t.timestamps
      end
    end
  end
  