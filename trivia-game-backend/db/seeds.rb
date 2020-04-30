# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
# require 'securerandom'

User.delete_all
Question.delete_all
UserQuestion.delete_all

user1 = User.create(name: "DannyTwoThumbs")
user2 = User.create(name: "I can whistle")

question1 = Question.create(question_text: "What was the punishment for Sysiphus's craftiness?", correct_answer: "Cursed to roll a boulder up a hill for eternity.", incorrect_answers: ["Tied to a boulder for eternity.", "Being pecked by birds.", "Standing in a lake filled with water he could not drink.", "To fell a tree that regenerated after every axe swing."])
question2 = Question.create(question_text: "According to a Beatles song, who kept her face in a jar by the door?", correct_answer: "Eleanor Rigby", incorrect_answers: ["Loretta Martin.", "Molly Jones.", "Lady Madonna."])
question3 = Question.create(question_text: "The mountainous Khyber Pass connects which of the two following countries?", correct_answer: "Afghanistan and Pakistan", incorrect_answers: ["India and Nepal.", "Pakistan and India.", "Tajikistan and Kyrgyzstan."])

userquestion1 = UserQuestion.create(points: 1, user_id: user1.id, question_id: question2.id)
userquestion2 = UserQuestion.create(points: 1, user_id: user2.id, question_id: question1.id)