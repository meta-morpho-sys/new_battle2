feature 'Players subscribe for the game' do
  scenario 'filling in a form' do
    session = sign_in_session_and_play
    expect(session).to have_content 'Monster Yuliya Vs Monster Alan'
  end
end
