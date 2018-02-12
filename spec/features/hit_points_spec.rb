feature 'Displaying hit points' do
  context 'at the beginning of the game' do
    before { sign_in_and_play }
    scenario 'see hit points for Player 1' do
      expect(page).to have_content 'Yuliya: 60 HP'
    end

    scenario 'see hit points for Player 2' do
      expect(page).to have_content 'Alan: 60 HP'
    end
  end

  context 'while playing the game', js: true do
    before do
      sign_in_and_play
    end
    scenario 'points reduced randomly for player 2' do
      expect(Kernel).to receive(:rand).and_return(7)
      attack_and_confirm
      expect(page).not_to have_content 'Alan: 60 HP'
      expect(page).to have_content 'Alan: 53 HP'
    end

    scenario 'points reduced randomly for player 1' do
      expect(Kernel).to receive(:rand).twice.and_return(7)
      2.times { attack_and_confirm }
      expect(page).not_to have_content 'Yuliya: 60 HP'
      expect(page).to have_content 'Yuliya: 53 HP'
    end

    scenario 'when player 1 misses to hit player 2' do
      expect(Kernel).to receive(:rand).and_return(0)
      attack_and_confirm
      expect(page).to have_content 'You missed!!!😝'
    end
  end
end
