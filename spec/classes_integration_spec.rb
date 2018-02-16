require 'player'
require 'game'

describe 'Game' do
  let(:alan) { Player.new 'Alan' }
  let(:yuliya) { Player.new 'Yuliya' }

  subject(:game) { Game.create(alan, yuliya) }

  it 'rotates players' do
    game.attack
    expect(game.current_turn).to eq alan
    expect(game.other_turn).to eq yuliya
    game.switch_turn
    expect(game.current_turn).to eq yuliya
    expect(game.other_turn).to eq alan
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

  context 'precedence of turns' do
    context 'attack after paralyse' do
      example 'player 2 recovers from paralysis and takes turn to attack' do
        # Alan successfully paralyses Yuliya
        yuliya.paralysed = true
        # it is Alan's turn
        expect(game.current_turn).to eq alan
        # so Alan takes this opportunity to attack Yuliya
        game.switch_turn
        expect(game.current_turn).to eq alan
        game.attack
        game.unparalyse if game.other_turn.paralysed?
        game.switch_turn
        # now the turn should pass to Yuliya
        expect(game.current_turn).to eq yuliya
      end
    end
  end
end

# alan = Player.new 'Alan'
# yuliya = Player.new 'Computer'
#
# game = Game.create(alan, yuliya)
#
# 12.times do
#   game.attack
#
#   p alan, yuliya, game.other_turn.damage_score
#   puts
#
#   game.switch_turn
# end
