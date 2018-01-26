feature 'Displaying hit points' do
  scenario 'see hit points for Player 1' do
    # session = sign_in_session_and_play
    # expect(session).to have_content 'Alan: 60 HP'
    sign_in_and_play
    expect(page).to have_content 'Yuliya: 60 HP'
  end

  scenario 'see hit points for Player 2' do
    # session = sign_in_session_and_play
    # expect(session).to have_content 'Alan: 60 HP'
    sign_in_and_play
    expect(page).to have_content 'Alan: 60 HP'
  end

  scenario 'reduced points for player 2 after being attacked' do
    sign_in_and_play
    click_link 'Attack'
    click_button 'Ok'
    expect(page).not_to have_content 'Alan: 60 HP'
    expect(page).to have_content 'Alan: 50 HP'
  end
end
