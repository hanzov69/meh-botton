var Nightmare = require('nightmare');

var username = process.env.MEHUSERNAME;
var password = process.env.MEHPASSWORD;
var site = 'https://meh.com';

function buttonClicker(){
        console.log('go and click');

        new Nightmare()
            .goto(site)
            .wait('.meh-button button')
            .screenshot('10.png')
            .click('.meh-button button')
            .wait('#user')
            .screenshot('20.png')
            .type('#user', username)
            .type('#password', password)
            .click('form button')
            .wait('.meh-button')
            .screenshot('30.png')
            .run(function(err, nightmare) {
                if (err) {
                    return console.log(err);
                    process.exit(1);
                }

                console.log('meh button clicked');
                process.exit();
            });

    };
buttonClicker();
