User.destroy_all
Game.destroy_all
Jet.destroy_all


amelia = User.create(username: "amelia", password: "amelia", country: "USA")
david = User.create(username: "david", password: "david", country: "USA")

game = Game.create(game_intro: "jwehrkwejhrskdjhf", hits: 10, opener_id: nil)

jet1 = Jet.create(user_id: amelia.id, game_id: game.id, user_health: 10, user_score: 0, country_color: "red")
jet2 = Jet.create(user_id: david.id, game_id: game.id, user_health: 10, user_score: 0, country_color: "red")