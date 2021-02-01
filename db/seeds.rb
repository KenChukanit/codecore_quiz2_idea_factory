

Idea.delete_all
Review.delete_all
User.delete_all

NUM_OF_IDEAS = 50
NUM_USER=15

PASSWORD='supersecret'
super_user= User.create(
    name: 'Ken',
    email: 'chonlasek.c@gmail.com',
    password: 'concon',
)

NUM_USER.times do
    name= Faker::Name.first_name 
    User.create(
        name: name,
        email: "#{name}@example.com",
        password: PASSWORD
    )
    end

users=User.all

NUM_OF_IDEAS.times do
    created_at = Faker::Date.backward(days: 30)
    i = Idea.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::Cannabis.health_benefit,
        user: users.sample,
        likers: users.shuffle.slice(0,rand(users.count))
    )
    
    if i.valid?
        i.reviews = rand(0..15).times.map do
            Review.new(
                body: Faker::GreekPhilosophers.quote,
                user: users.sample
            )
        end
        
    
end

ideas = Idea.all
reviews = Review.all


puts Cowsay.say("Created #{ideas.count} ideas", :koala)
puts Cowsay.say("Created #{reviews.count} reviews.",:frogs)
puts Cowsay.say("Created #{users.count} users.",:sheep)
puts Cowsay.say("Created #{Like.count} likes.",:bunny)

end