require 'player'
require 'game'

describe 'Game' do
  let(:alan) { Player.new 'Alan' }
  let(:yuliya) { Player.new 'Yuliya' }

  subject(:game) { Game.create(alan, yuliya) }

  it 'rotates players' do
      game.attack
      expect(game.current_turn.name).to eq 'Alan'
      expect(game.other_turn.name).to eq 'Yuliya'
      game.switch_turn
      expect(game.current_turn.name).to eq 'Yuliya'
      expect(game.other_turn.name).to eq 'Alan'
  end

  context 'monitoring the score', :aggregated_failures do
    it 'displays damage scores and total points for the each player' do
      allow(Kernel).to receive(:rand).and_return(9)
      game.attack
      expect(game.current_turn.damage_score).to eq nil
      expect(game.other_turn.damage_score).to eq 9

      game.switch_turn
      allow(Kernel).to receive(:rand).and_return(11)
      game.attack
      expect(game.current_turn.damage_score).to eq 9
      expect(game.other_turn.damage_score).to eq 11

      game.switch_turn
      allow(Kernel).to receive(:rand).and_return(6)
      game.attack
      expect(game.current_turn.damage_score).to eq 11
      expect(game.other_turn.damage_score).to eq 6

      expect(alan.hit_points).to eq 49
      expect(yuliya.hit_points).to eq 45
    end

    it 'announces the loser' do
      allow(Kernel).to receive(:rand).and_return(60)
      game.attack
      expect(game.loser.name).to eq 'Yuliya'
      expect(game.loser.hit_points).to eq 0
    end
  end
end
#
# alan = Player.new 'Alan'
# yuliya = Player.new 'Yuliya'
#
# game = Game.create(alan, yuliya)
#
# 25.times do
#   game.attack
#
#   p alan, yuliya, game.current_turn.damage_score, game.other_turn.damage_score
#   puts
#
#   game.switch_turn
# end