feature 'Player can make his opponent lose the chance to attack', js: true do
  scenario 'Player 1 manages to paralyse his opponent' do
    sign_in_and_play
    click_button 'Paralyse'
    expect(page).to have_content "Alan was paralysed.🤐 Yuliya's turn again!"
  end
#
  scenario 'Player 2 manages to paralyse his opponent' do
    # player1 = instance_double('Player')
    # array = Array.new
    # allow(array).to receive(:sample).and_return true
    allow_any_instance_of(Player).to receive(:paralysed?).and_return true
    sign_in_and_play
    click_button 'Attack'
    click_button 'Paralyse'
    expect(page).to have_content "Yuliya was paralysed.🤐 Alan's turn again!"
  end

  scenario "Player 1 doesn't succeed to paralyse his opponent" do
    # player = instance_double('Player')
    sign_in_and_play
    # allow(player).to receive(:paralysed?).and_return false
    click_button 'Paralyse'
    expect(page).to have_content 'You missed your chance to paralyse Alan. 😛😛😛'
  end
end
