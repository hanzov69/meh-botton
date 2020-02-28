const Nightmare = require('nightmare');

var session  = process.env.MEHSESSION;
var site = 'https://meh.com';

function buttonClicker(){
        console.log('go and click');

        new Nightmare()
	    //.goto(site)
            .cookies.set({
              url: "https://meh.com",
              name: "session.meh.com",
              value: session
            })
	    .goto(site)
	    .wait('.meh-button button')
            .screenshot('10.png')
            .click('.meh-button button')
            .screenshot('20.png')
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
