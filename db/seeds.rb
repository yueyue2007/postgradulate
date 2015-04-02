# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.delete_all
admin = Admin.create(email:"admin@hnswdx.gov.cn",password:"1Qaz3edc")

Grade.delete_all
grades = Grade.create([{name:"2014级法学",description:"2014 年入学"},\
                       {name:"2015级马克思主义",description:"2015年入学"},\
                       {name:"2013级哲学",description:"2013年入学，班主任老师是李老师"}])

Course.delete_all
courses = Course.create([{name:"法学概论",teacher:"吴教授"},\
                        {name:"英语阅读",teacher:"张老师"},\
                        {name:"马克思主义概论",teacher:"李老师"},\
                        {name:"科学社会主义",teacher:"洪教授"},\
                        {name:"中国文艺",teacher:"李教授"},\
                        {name:"大众电影",teacher:"李教授"},\
                        {name:"数据结构",teacher:"陈老师"},\
                        {name:"编译原理",teacher:"马老师"},\
                        {name:"电子技术",teacher:"商老师"},\
                        {name:"歌曲欣赏",teacher:"高老师"},\
                        {name:"公务员修养",teacher:"关老师"},\
                        {name:"军事纵横",teacher:"徐教授"},\
                        {name:"纪委工作",teacher:"王院士"},\
                        {name:"综合国情",teacher:"任老师"}])
User.delete_all
user1 = User.create({name:"李世民",stuno:"20140002",major:"法学"})
user1.grade = Grade.first
user1.save!
user2 =  User.create({name:"赵匡胤",stuno:"20130003",major:"马克思主义"})
user2.grade = Grade.last
user2.save!

Research.delete_all
r1 = Research.create({title:"两个三十年的比较",magazine:"湖湘论坛"})
r1.user = user1
r1.save!
r2 = Research.create({title:"西方价值观批判",magazine:"湖南行政学院学报"})
r2.user = user2
r2.save!

Score.delete_all
(1..13).each do |i|
  Score.create(user:user1,course:courses[i],course_score:"87")
end



