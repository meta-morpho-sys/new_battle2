def sign_in_session_and_play
  session = Capybara::Session.new(:selenium)
  session.visit('http://127.0.0.1:9393/new_player_form')
  session.fill_in 'monster_name1', with: 'Yuliya'
  session.fill_in 'monster_name2', with: 'Alan'
  session.click_button 'Monsterize!'
  session
end

def sign_in_and_play
  visit '/new_player_form'
  fill_in 'monster_name1', with: 'Yuliya'
  fill_in 'monster_name2', with: 'Alan'
  click_button 'Monsterize!'
end

def attack_and_confirm
  click_button 'Attack'
  click_button 'Ok'
end
