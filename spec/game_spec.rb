require 'game'

describe Game do
  subject(:game) { Game.new(alan, yuliya) }
  let(:alan) { double :player }
  let(:yuliya) { double :player }

  describe '#player1' do
    it 'retrieves the first player' do
      expect(game.player1).to eq alan
    end
  end

  describe '#player2' do
    it 'retrieves the second player' do
      expect(game.player2).to eq yuliya
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(alan).to receive(:receive_damage)
      game.attack(alan)
    end
  end
end
