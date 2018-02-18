feature 'Player can make his opponent lose the chance to attack', js: true do
  before do
    allow_any_instance_of(Array).to receive(:sample).and_return true
  end
  scenario 'Player 1 manages to paralyse his opponent' do
    sign_in_and_play
    click_button 'Paralyse'
    expect(page).to have_content "Alan was paralysed.🤐 Yuliya's turn again!"
  end
#
  scenario 'Player 2 manages to paralyse his opponent' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'Paralyse'
    expect(page).to have_content "Yuliya was paralysed.🤐 Alan's turn again!"
  end

  scenario "Player 1 doesn't succeed to paralyse his opponent" do
    sign_in_and_play
    allow_any_instance_of(Array).to receive(:sample).and_return false
    click_button 'Paralyse'
    expect(page).to have_content 'You missed your chance to paralyse Alan. 😛😛😛'
  end
end
