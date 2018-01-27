feature 'Switch turns' do
  context 'seeing current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content "Yuliya's turn"
    end

    scenario 'after Player 1 attacks' do
      sign_in_and_play
      attack_and_confirm
      expect(page).not_to have_content "Yuliya's turn"
      expect(page).to have_content "Alan's turn"
    end
  end
end
