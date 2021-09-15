//if env not 
if (!process.env.PROXY_URL || !process.env.PROCESS_URL){
	process.exit();
}

const Nightmare = require('nightmare');
nightmare = Nightmare({
	switches: {
        'proxy-server': process.env.PROXY_URL,
        'ignore-certificate-errors': true
    },
	show: true
});

nightmare.viewport(1080, 1920) 
.goto(process.env.PROCESS_URL)
.wait()
.then(function(details){
  console.log('hellp');
  setTimeout(process.exit , 550000);
});
