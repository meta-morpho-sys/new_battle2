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

  context 'while playing the game' do
    before { sign_in_and_play; attack_and_confirm }

    scenario 'reduced points for player 2 after being attacked' do
      expect(page).not_to have_content 'Alan: 60 HP'
      expect(page).to have_content 'Alan: 50 HP'
    end

    scenario 'reduced points for player 1 after being attacked' do
      attack_and_confirm
      expect(page).not_to have_content 'Yuliya: 60 HP'
      expect(page).to have_content 'Yuliya: 50 HP'
    end
  end
end
