RSpec.describe "a visitor visits the astronaut index page" do
  it 'should show a list of all astronauts' do
    neil = Astronaut.new(name: 'Neil Armstrong', age: 37, job: 'Commander')

    visit "/astronauts"

    expect(page).to have_content("#{neil.name}")
    expect(page).to have_content("#{neil.age}")
    expect(page).to have_content("#{neil.job}")
  end

  it 'should show an average age for astronauts' do
    neil = Astronaut.new(name: 'Neil Armstrong', age: 37, job: 'Commander')
    buzz = Astronaut.new(name: 'Buzz Aldren', age: 57, job: 'Commander')


    visit "/astronauts"

    expect(page).to have_content("Average age: 47")
  end
end
