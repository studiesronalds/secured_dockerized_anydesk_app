// const BrowserWindow = require('electron');

// mainWindow = new BrowserWindow(
// {
// 	webPreferences: {webSecurity: false},
// 	width: 800, height: 600,
// 	// switches: {
//  //        'proxy-server': 'proxy:8080',
//  //        'ignore-certificate-errors': true
//  //    },
// 	show: true
// });

// mainWindow.webContents.session.setProxy({proxyRules:"http://proxy:8080"}, function () {
//     mainWindow.loadURL('http://www.upwork.com');
// });

const Nightmare = require('nightmare');
nightmare = Nightmare({
	switches: {
        'proxy-server': 'proxy:8080',
        'ignore-certificate-errors': true
    },
	show: true
});

nightmare.viewport(800, 1600)
.goto('http://www.upwork.com/session_grab')
.wait()
.then(function(details){
  console.log('hellp');
  setTimeout(process.exit , 550000);
});