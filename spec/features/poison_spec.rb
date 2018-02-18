feature 'Poisoning the opponent', js: true do
  scenario 'Player 1 poisons player 2' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return 4
    click_button 'Poison'
    expect(page).to have_content 'Alan got poisoned and may lose 4 points.'
  end
end
