feature 'Players subscribe for the game' do
  scenario 'filling in a form' do
    sign_in_and_play
    expect(page).to have_content 'Monster Yuliya Vs Monster Alan'
  end

  scenario 'playing against a computer opponent' do
    sign_in_and_play_against_computer
    expect(page).to have_content 'Monster Yuliya Vs Monster Computer'
  end
end
