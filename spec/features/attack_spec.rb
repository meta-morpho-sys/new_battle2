feature 'Attack' do
  scenario 'player 1 attacks player 2' do
    # sign_in_and_play
    session = sign_in_session_and_play
    session.click_link 'Attack'
    expect(session).to have_content 'Yuliya attacks Alan'
  end
end
