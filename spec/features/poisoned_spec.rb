feature 'Poisoning the opponent', js: true do
  before do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return 4
    click_button 'Poison'
  end

  scenario 'Player 1 poisons player 2' do
    expect(page).to have_content 'Alan got poisoned and may lose 4 points.'
  end

  scenario 'Player 2 decides to pass turn and recover from poisoning' do
    click_button 'Pass'
    expect(page).to have_content "Yuliya's turn"
  end
end
