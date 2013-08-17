# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

DeviceType.create( name: 'person.mobile.iphone' )
DeviceType.create( name: 'person.mobile.android' )
DeviceType.create( name: 'person.card' )
DeviceType.create( name: 'anonymous.alarmclock' )

semen=User.create(
  email: 'semen@yandex.ru',
  password: '123123',
  first_name: 'Семён',
  last_name: 'Борода',
  gender: 1,
  birth_date: '1970-01-15')

alena=User.create(
  email: 'alena@yandex.ru',
  password: '555333',
  first_name: 'Алёна',
  last_name: 'Сливина',
  gender: 0,
  birth_date: '1990-04-12')

dev1=Device.create(
      device_type_id: 1,
      user: semen,
      name: 'Semens device',
      device_key: 'JKSAHDKJsd-09jhj'
)
Visit.create(
      user: semen,
      device: dev1,
      session_key: 1,
      closed_at: 1376785433
)
Visit.create(
      user_id: 1,
      device: dev1,
      session_key: 2,
      closed_at: 1376789433
)
