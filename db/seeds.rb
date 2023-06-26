puts ('Creating Teams')

2.times do |index|
    Team.create(name: "Team #{index}")
end

puts ('Creating Players')

teams = Team.all

teams.each do |team|
  3.times do |index|
    team.players.create(name: "#{team.name} Player #{index}")
  end
end

puts ('Creating Matches')

3.times do
    home_team = Team.order('RANDOM()').first
    away_team = Team.where.not(id: home_team.id).order('RANDOM()').first
    Match.create(home_team: home_team, away_team: away_team)
end

puts ('Creating Stats')
mantches = Match.all

mantches.each do |match|
    match.home_team.players.each do |player|
      Statistic.create(
        match: match,
        player: player,
        goals: rand(0..3),
        assists: rand(0..2),
        pass_accuracy: rand(50..100),
        distance_covered: rand(5.0..12.0).round(1)
      )
    end
  
    match.away_team.players.each do |player|
      Statistic.create(
        match: match,
        player: player,
        goals: rand(0..3),
        assists: rand(0..2),
        pass_accuracy: rand(50..100),
        distance_covered: rand(5.0..12.0).round(1)
      )
    end
end