feature 'End of the game', :aggregated_failures do
  context 'when Player 1 reaches 0 HP first' do
    before do
      sign_in_and_play
      random = Kernel
      allow(random).to receive(:rand).and_return(60)
    end

    scenario 'the player looses' do
      click_button 'Attack'
      expect(page).to have_content 'Alan loses!'
    end
  end

  context 'when Player 2 reaches 0 HP first' do
    before do
      sign_in_and_play
      attack_and_confirm
      random = Kernel
      allow(random).to receive(:rand).and_return(60)
    end

    scenario 'the player looses' do
      click_button 'Attack'
      expect(page).to have_content 'Yuliya loses!'
    end
  end
end
