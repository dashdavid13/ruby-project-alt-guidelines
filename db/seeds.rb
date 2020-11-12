User.destroy_all
Game.destroy_all
Jet.destroy_all


amelia = User.create(username: "amelia", password: "amelia")
david = User.create(username: "david", password: "david")

game = Game.create

jet1 = Jet.create(user_id: amelia.id, game_id: game.id,  user_score: 0)
jet2 = Jet.create(user_id: david.id, game_id: game.id,  user_score: 0)