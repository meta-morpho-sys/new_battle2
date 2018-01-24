feature 'Players subscribe for the game' do
  scenario 'filling in a form' do
    session = Capybara::Session.new(:selenium)
    session.visit('http://127.0.0.1:9393/new_player_form')
    session.fill_in 'monster_name1', with: 'Yuliya'
    session.fill_in 'monster_name2', with: 'Alan'
    session.click_button 'Monsterize!'
    expect(session).to have_content 'Monster Yuliya Vs Monster Alan'
  end
end
