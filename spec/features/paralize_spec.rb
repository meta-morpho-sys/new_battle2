feature 'Player can make his opponent lose the chance to attack', js: true do
  scenario 'Player 1 manages to paralyse his opponent' do
    sign_in_and_play
    click_button 'Paralyse'
    expect(page).to have_content 'Alan was paralyzed.🤐 He misses a turn!'
  end
end
