feature 'Attack the opponent player' do
  scenario 'Player 1 attacks player 2 and sees confirmation' do
    # session = sign_in_session_and_play
    # session.click_link 'Attack'
    # expect(session).to have_content 'Yuliya attacks Alan'
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Yuliya attacks Alan'
  end

  scenario 'Player 2 attacks player 1 and sees a confirmation' do
    sign_in_and_play
    attack_and_confirm
    click_button 'Attack'
    expect(page).to have_content 'Alan attacks Yuliya'
  end
end
