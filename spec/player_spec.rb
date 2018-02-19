require 'player'

describe Player do
  subject(:alan) { Player.new 'Alan' }
  let(:yuliya) { Player.new 'Yuliya' }
  let(:player2) { Player.new 'Computer' }
  let(:game) { double :game }

  it 'knows his name' do
    expect(alan.name).to eq 'Alan'
  end

  it 'knows it is a computer' do
    expect(player2.a_computer?).to eq true
  end

  describe '#hit points' do
    it 'returns the hit points' do
      expect(alan.hit_points).to eq Player::DEFAULT_HIT_POINTS
    end
  end

  context 'alteration of HPs' do
    before do
      expect(Kernel).to receive(:rand).and_return(28)
    end

    describe '#receive damage' do
      it "reduces player's hit points" do
        allow(game).to receive(:attack)
        game.attack alan
        expect { alan.receive_damage }.to change { alan.hit_points }.by(-28)
      end
    end

    describe '#reduce damage' do
      it 'increases the HP of the player' do
        allow(game).to receive(:heal)
        game.heal alan
        expect { alan.reduce_damage }.to change { alan.hit_points }.by(28)
      end
    end
  end

  describe '#try_to_paralyse' do
    before do
      allow_any_instance_of(Array).to receive(:sample).and_return true
    end
    it 'can randomly paralyse the opponent' do
      expect(alan.try_to_paralyse).to eq true
    end
  end
end
