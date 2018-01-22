feature 'Testing infrastructure' do
  scenario 'it visits a page successfully' do
    visit('/')
    expect(page).to have_content 'Testing infrastructure working!'
  end
end