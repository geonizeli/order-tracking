unless User.find_by(email: 'admin@example.com')
  User.create!(
    email: 'admin@example.com',
    password: 'password'
  )
end
