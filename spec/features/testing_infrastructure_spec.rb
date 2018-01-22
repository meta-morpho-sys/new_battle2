feature 'Testing homepage' do
  scenario 'it visits the home page successfully' do
    visit '/'
    expect(page).to have_content 'The BATTLE begins!!!'
  end

  scenario 'it redirects you to a page where you can subscribe' do
    visit '/'
    click_link 'Create your monsters!'
    expect(page).to have_current_path('/new_player_form')
  end
end
