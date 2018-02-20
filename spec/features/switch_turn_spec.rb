feature 'Switch turns', js: true do
  before { sign_in_and_play }

  context 'seeing current turn' do
    scenario 'at the start of the game' do
      expect(page).to have_content "Yuliya's turn"
    end

    scenario 'after Player 1 attacked' do
      click_button 'Attack'
      expect(page).not_to have_content "Yuliya's turn"
      expect(page).to have_content "Alan's turn"
    end
  end

  scenario 'after Player 1 gets healed' do
    click_button 'Heal'
    expect(page).not_to have_content "Yuliya's turn"
    expect(page).to have_content "Alan's turn"
  end
end
