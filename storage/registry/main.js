console.log('hello');
const Nightmare = require('nightmare');

const nightmare = Nightmare({ show: true})
nightmare
  .goto('https://duckduckgo.com')
  .type('#search_form_input_homepage', 'github nightmare')
  .click('#search_button_homepage')
  .wait('#links .result__a')
  .evaluate(() => document.querySelector('#links .result__a').href)
  .end()
  .then(link => {
    expect(link).to.equal('https://github.com/segmentio/nightmare')
    done()
  });

// nightmare = Nightmare({ show: true});
// console.log(nightmare);
// nightmare.viewport(800, 1600)
// .goto('http://upwork.com')
// .screenshot('./invite_profile_invite.png')
// .wait()
// .evaluate(function(details){
//   console.log(123);
// })
// .end()
// .run(function(details){
//   console.log('in process');
//   setTimeout(process.exit , 550000);
// });

