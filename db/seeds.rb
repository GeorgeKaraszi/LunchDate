# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
    {
        name:'Tori',
        facebook: 'https://www.facebook.com/victoria.vandragt',
        linkedin: 'https://www.linkedin.com/in/torivandragt',
        twitter: 'https://twitter.com/sunshinetor'
    },
    {
        name:'Joel',
        facebook: 'https://www.facebook.com/joelataylor',
        linkedin: 'https://www.linkedin.com/in/joelataylor',
        twitter: 'https://twitter.com/joelataylor'
    },
    {
        name:'Aaron',
        facebook: 'https://www.facebook.com/schaapy',
        linkedin: 'https://www.linkedin.com/in/schaapy',
        twitter: 'https://twitter.com/schaapy'
    },
    {
        name:'Andy',
        facebook: 'https://www.facebook.com/andrewlphilpott',
        linkedin: 'https://www.linkedin.com/in/andywestmoreland',
        twitter: 'https://twitter.com/akwestmoreland'
    },
    {
        name:'Andrew',
        facebook: 'https://www.facebook.com/andrewlphilpott',
        linkedin: 'https://www.linkedin.com/in/andrewlphilpott',
        twitter: 'https://twitter.com/andrewlphilpott'
    },
    {
        name:'Emily',
        facebook: 'https://www.facebook.com/emily.noffsinger',
        linkedin: 'https://www.linkedin.com/in/emnoffsinger',
        twitter: 'https://twitter.com/emnoff'
    },
    {
        name:'Amelie',
        facebook: 'https://www.facebook.com/amelie.macdonald',
        linkedin: 'https://www.linkedin.com/in/ameliemacdonald',
        twitter: 'https://twitter.com/ameliemacdonald'
    },
    {
        name:'Joy',
        facebook: 'https://www.facebook.com/joy.b.eling',
        linkedin: 'https://www.linkedin.com/in/joyeling',
        twitter: 'https://twitter.com/joyeling'
    },
    {
        name:'Justin',
        facebook: 'https://www.facebook.com/justin.heuss',
        linkedin: 'https://www.linkedin.com/in/justin-heuss-32447335',
        twitter: 'https://twitter.com/justinheuss'
    }
]

User.create!(users)