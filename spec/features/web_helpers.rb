def sign_in_and_play
  session = Capybara::Session.new(:selenium)
  session.visit('http://127.0.0.1:9393/new_player_form')
  session.fill_in 'monster_name1', with: 'Yuliya'
  session.fill_in 'monster_name2', with: 'Alan'
  session.click_button 'Monsterize!'
  session
end