require 'game'

describe Game do
  subject(:game) { Game.new }
  let(:alan) { double :player }
  let(:yuliya) { double :player }

  describe '#attack' do
    it 'damages the player' do
      expect(alan).to receive(:receive_damage)
      game.attack(alan)
    end
  end
end
