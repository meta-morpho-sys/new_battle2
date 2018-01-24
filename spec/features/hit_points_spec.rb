feature 'Viewing hit points' do
  scenario 'for Player 2' do
    session = sign_in_session_and_play
    expect(session).to have_content 'Alan: 60 HP'
  end
end
