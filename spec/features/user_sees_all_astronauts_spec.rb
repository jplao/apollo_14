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

  it 'should show an a mist of mission' do
    neil = Astronaut.new(name: 'Neil Armstrong', age: 37, job: 'Commander')
    mission_1 = Astronaut.missions.create(name: "Apollo 13")
    mission_2 = Astronaut.missions.create(name: "Capricorn 4")
    mission_3 = Astronaut.missions.create(name: "Gemini 7")

    visit "/astronauts"

    expect(page).to have_content(mission_1.name)
  end
end
