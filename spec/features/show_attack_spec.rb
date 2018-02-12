feature 'Attack the opponent player', js: true do
  scenario 'Player 1 attacks player 2 and sees confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Yuliya attacks Alan'
  end

  scenario 'Player 2 attacks player 1 and sees a confirmation' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Attack'
    expect(page).to have_content 'Alan attacks Yuliya'
  end

  scenario 'the page displays the score of the current attack' do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(8)
    click_button 'Attack'
    expect(page).to have_content 'The score is 8'
  end

  # scenario 'Computer attacks player 1' do
  #   sign_in_and_play_against_computer
  #   # in /play Yuliya clicks ATTACK
  #   # in /attack Yuliya clicks OK
  #   attack_and_confirm
  #   # now it is COMP's turn
  #   expect(current_path).to eq '/computer'
  # end
end
