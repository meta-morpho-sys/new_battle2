feature 'Players subscribe for the game' do
  scenario 'filling in a form' do
    visit('new_player_form')
    fill_in 'monster_name1', with: 'Yuliya'
    fill_in 'monster_name2', with: 'Alan'
    click_button 'Monsterize!'
    expect(page).to have_content 'Monster Yuliya Vs Monster Alan'
  end
end
