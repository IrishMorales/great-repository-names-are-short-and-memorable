"use strict";

module.exports = {
	activate(){
		console.log("I am package, hear me roar.");
		global.YOU_DID_IT = "YIPPEE";
		global.DID_LOAD = true;
	},
	
	deactivate(){
		console.log("Bye");
		delete global.YOU_DID_IT;
		delete this;
	}
};
