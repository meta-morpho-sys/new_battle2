feature 'End of the game' do
  context 'when Player 1 reaches 0 HP first' do
    before do
      sign_in_and_play
      10.times { attack_and_confirm }
      # allow(Random).to receive(:rand).and_return(60)
    end

    scenario 'the player looses' do
      click_button 'Attack'
      expect(page).to have_content 'Alan loses!'
    end
  end
end
