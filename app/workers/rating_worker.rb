class RatingWorker
  include Sidekiq::Worker

  def perform(winner_id, battle_id)
    battle = Battle.find(battle_id)
    winner = battle.teams.find(winner_id)
    looser = battle.teams.where.not(id: winner_id).first
    looser.update(rating: looser.rating -= 20)
    winner.update(rating: winner.rating += 20)
  end
end
