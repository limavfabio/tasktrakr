# Create some users
3.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    confirmed_at: Time.now
  )

  # Create projects for each user
  3.times do
    project = user.projects.create!(
      name: Faker::Company.unique.name,
    )

    # Create tasks for each project
    5.times do
      project.tasks.create!(
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph,
        due_date: Faker::Date.forward(days: 30),
        status: ['todo', 'in_progress', 'done'].sample,
        completed: Faker::Boolean.boolean(true_ratio: 0.3)
      )
    end
  end

  # Create tasks for each user's inbox
  5.times do
    inbox = user.projects.find_by is_inbox: true
    inbox.tasks.create!(
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.paragraph,
      due_date: Faker::Date.forward(days: 30),
      status: ['todo', 'in_progress', 'done'].sample,
      completed: Faker::Boolean.boolean(true_ratio: 0.2)
    )
  end
end

# Create the inbox project for each user
# User.find_each do |user|
#   user.create_inbox
# end
