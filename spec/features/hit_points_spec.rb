feature 'Viewing hit points' do
  scenario 'for Player 2' do
    session = Capybara::Session.new(:selenium)
    session.visit('http://127.0.0.1:9393/new_player_form')
    session.fill_in 'monster_name1', with: 'Yuliya'
    session.fill_in 'monster_name2', with: 'Alan'
    session.click_button 'Monsterize!'
    expect(session).to have_content 'Alan: 60 HP'
  end
end
