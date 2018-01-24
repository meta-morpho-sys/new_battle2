feature 'Attack the opponent player' do
  scenario 'Player 1 attacks player 2 and sees confirmation' do
    session = sign_in_session_and_play
    session.click_link 'Attack'
    expect(session).to have_content 'Yuliya attacks Alan'
  end
end
