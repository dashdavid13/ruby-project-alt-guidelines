User.destroy_all
Game.destroy_all
Jet.destroy_all


amelia = User.create(username: "amelia", password: "amelia")
david = User.create(username: "david", password: "david")
test = User.create(username: "test", password: "1234")
dw = User.create(username: "dw", password: "dw")
laura = User.create(username: "laura", password: "laura")

game = Game.create

jet1 = Jet.create(user_id: amelia.id, game_id: game.id,  user_score: 0)
jet2 = Jet.create(user_id: david.id, game_id: game.id,  user_score: 0)