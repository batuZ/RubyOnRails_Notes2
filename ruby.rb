puts 'this is ruby code'
puts 'for git know me'

c

#seeds.rb

# Position
#116.22 ~ 116.52
#39.85 ~ 40.02
sm = 1.0e-10

100.times do |pos|
	rx = rand(0.22/sm..0.52/sm)*sm
	randx = 116 + rx
	r = rand(39..40)
	rk = r == 39 ? 1 - rand(0.15/sm)*sm : rand(0.02/sm)*sm
	randy = r + rk
	Positoin.create(x:randx ,y:randy ,z:0)
end

#Sount

# User
User.create(name: 'Batu', p_id:1, range: 12)
User.create(name: 'Zhangzhi', p_id:2, range: 20)


#schema.rb

ActiveRecord::Schema.define(version: 20180816132217) do

  create_table "positoins", force: :cascade do |t|
    t.float "x"
    t.float "y"
    t.float "z"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sounds", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.integer "p_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "p_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "range"
  end

end
