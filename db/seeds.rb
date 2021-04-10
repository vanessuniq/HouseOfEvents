require 'securerandom'

Rake::Task["db:reset"]

users = [
    {
        name: "Ron Daniels",
        email: "rondan@gmail.com",
        email_confirmation: "rondan@gmail.com",
        password: SecureRandom.alphanumeric(8)
    },
    {
        name: "Vita Love",
        email: "vitalov@gmail.com",
        email_confirmation: "vitalov@gmail.com",
        password: SecureRandom.alphanumeric(8)
    },
    {
        name: "Sophie Verga",
        email: "verfaSop@gmail.com",
        email_confirmation: "vergaSop@gmail.com",
        password: SecureRandom.alphanumeric(8)
    },
    {
        name: "Sam Ruler",
        email: "samrul@gmail.com",
        email_confirmation: "samrul@gmail.com",
        password: SecureRandom.alphanumeric(8)
    }
]

User.create(users)

user_ids = User.all.map {|user| user.id}

json = ActiveSupport::JSON.decode(File.read('db/seeds/events.json'))
json.each do |record|
  record["user_id"] = user_ids.sample
  Event.create!(record)
end

