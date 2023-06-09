# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.create(name: "Water my plants", completed: false)
Task.create(name: "Learn Coding", completed: false)
Task.create(name: "Go to the Gym", completed: true)

Subtask.create(name: "Water the plants in the living room", completed: false, task_id: 1)
Subtask.create(name: "Water the plants in the kitchen", completed: false, task_id: 1)
Subtask.create(name: "Learn Rails", completed: false, task_id: 2)
