feature 'End of the game', :aggregated_failures do
  context 'when Player 1 reaches 0 HP first' do
      before do
        sign_in_and_play
        allow(Kernel).to receive(:rand).and_return(60)
      end

      scenario 'the player loses' do
        click_button 'Attack'
        expect(page).to have_content 'Alan loses!'
      end
  end

  context 'when Player 2 reaches 0 HP first' do
    before do
      sign_in_and_play
      attack_and_confirm
      allow(Kernel).to receive(:rand).and_return(60)
    end

    scenario 'the player loses' do
      click_button 'Attack'
      expect(page).to have_content 'Yuliya loses!'
    end
  end
end
