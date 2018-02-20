require 'game'

describe Game do
  subject(:game) { Game.new(player1, player2) }
  subject(:finished_game) { Game.new(dead_player, player2) }
  let(:player1) { double :Yuliya, hit_points: 60 }
  let(:player2) { double :Alan, hit_points: 60 }
  let(:dead_player) { double :player, hit_points: 0 }
  let(:current_player) { double :player1 }

  describe '#player1' do
    it 'retrieves the first player' do
      expect(game.player1).to eq player1
    end
  end

  describe '#player2' do
    it 'retrieves the second player' do
      expect(game.player2).to eq player2
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(player2).to receive(:receive_damage)
      game.attack(player2)
    end
  end

  describe '#paralyse' do
    it 'paralyses the opponent' do
      expect(player2).to receive(:try_to_paralyse)
      game.paralyse(player2)
    end
  end

  describe '#thaw' do
    it 'releases the opponent from his paralysis' do
      allow(player2).to receive(:paralysed=)
      game.thaw(player2)
    end
  end

  describe '#poison' do
    it 'damages the opponent by few points' do
      expect(player2).to receive(:receive_damage).with(1, 5)
      game.poison(player2)
    end
  end

  describe '#recover' do
    example 'player2 recovers points lost from poisoning' do
      expect(player2).to receive(:recover_points)
      game.recover_from_poison(player2)
    end
  end

  describe '#heal' do
    it 'increments the HP of the player' do
      expect(player1).to receive(:reduce_damage)
      game.heal(player1)
    end
  end

  describe '#current_turn' do
    it 'starts as player 1' do
      expect(game.current_turn).to eq player1
    end
  end

  describe '#other_turn' do
    it 'returns the opponent of the player' do
      expect(game.other_turn).not_to eq current_player
    end
  end

  describe '#switch_turns' do
    it 'switches the turn' do
      allow(player2).to receive(:paralysed?)
      game.switch_turn
      expect(game.current_turn).to eq player2
    end

    it 'switches the turn if the opponent in not paralysed' do
      allow(player2).to receive(:paralysed?).and_return false
      game.switch_turn
      expect(game.current_turn).to eq player2
    end

    it 'does not switches the turn if the opponent in paralysed' do
      allow(player2).to receive(:paralysed?).and_return true
      game.switch_turn
      expect(game.current_turn).to eq player1
    end
  end

  describe '#opponent_of' do
    it 'finds the opponent of the player' do
      expect(game.opponent_of(player1)).to eq player2
      expect(game.opponent_of(player2)).to eq player1
    end
  end

  describe '#game_over?' do
    it 'returns false if no-one of the players is at 0 HP' do
      expect(game.game_over?).to eq false
    end

    it 'returns true if one of the players is at 0 HP' do
      expect(finished_game.game_over?).to eq true
    end
  end

  describe '#loser' do
    it 'returns the player on less than 0 HP' do
      expect(finished_game.loser).to eq dead_player
    end
  end
end
