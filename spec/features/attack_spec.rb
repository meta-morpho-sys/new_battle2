feature 'Attack the opponent player' do
  scenario 'Player 1 attacks player 2 and sees confirmation' do
    # session = sign_in_session_and_play
    # session.click_link 'Attack'
    # expect(session).to have_content 'Yuliya attacks Alan'
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Yuliya attacks Alan'
  end
end