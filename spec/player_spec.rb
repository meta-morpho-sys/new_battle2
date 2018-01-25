require 'player'

describe Player do
  subject(:alan) { Player.new 'Alan' }
  let(:yuliya) { Player.new 'Yuliya' }
  let(:game) { double :game }

  it 'knows his name' do
    expect(alan.name).to eq 'Alan'
  end

  describe '#hit points' do
    it 'returns the hit points' do
      expect(alan.hit_points).to eq Player::DEFAULT_HIT_POINTS
    end
  end

  describe '#receive damage' do
    it "reduces player's hit points" do
      allow(game).to receive(:attack)
      game.attack(alan)
      expect { alan.receive_damage }.to change { alan.hit_points }.by(-10)
    end
  end
end
